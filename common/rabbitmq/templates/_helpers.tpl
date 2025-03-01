{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | replace "_" "-" | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | replace "_" "-" | trimSuffix "-" -}}
{{- end -}}

{{define "rabbitmq.release_host"}}{{.Release.Name}}-rabbitmq.{{.Release.Namespace}}.svc.kubernetes.{{.Values.global.region}}.{{.Values.global.tld}}{{end}}

{{- define "rabbitmq.transport_url" -}}{{ tuple . .Values.rabbitmq | include "rabbitmq._transport_url" }}{{- end}}

{{- define "rabbitmq._transport_url" -}}
{{- $envAll := index . 0 -}}
{{- $rabbitmq := index . 1 -}}
rabbit://{{ default "" $envAll.Values.global.user_suffix | print $rabbitmq.users.default.user }}:{{ required "$rabbitmq.users.default.password missing" $rabbitmq.users.default.password | urlquery}}@{{ include "rabbitmq.release_host" $envAll }}:{{ $rabbitmq.port | default 5672 }}{{ $rabbitmq.virtual_host | default "/" }}
{{- end}}

{{- define "rabbitmq.shell_quote" -}}
"{{ replace `\` `\\` . | replace `"` `\"` | replace `$` `\$` | replace "`" "\\`" }}"
{{- end }}

{{- define "rabbitmq.upsert_user" -}}
    {{- $path := index . 0 -}}
    {{- $v := index . 1 -}}
    {{- if not $v.user }}
        {{- fail (printf "%v.user missing" $path) }}
    {{- else if hasPrefix "-" $v.user }}
        {{- fail (printf "%v.user starts with hypen" $path) }}
    {{- else if not $v.password }}
        {{- fail (printf "%v.password missing" $path) }}
    {{- else if hasPrefix "-" $v.password }}
        {{- fail (printf "%v.password starts with hypen" $path) }}
    {{- else -}}
        upsert_user {{ $v.user | include "rabbitmq.shell_quote" }} {{ $v.password | include "rabbitmq.shell_quote" }}
        {{- if $v.tag }} {{ $v.tag | include "rabbitmq.shell_quote" }}
        {{- end }}
    {{- end }}
{{- end }}

{{/* Generate the service label for the templated Prometheus alerts. */}}
{{- define "alerts.service" -}}
{{- if .Values.alerts.service -}}
{{- .Values.alerts.service -}}
{{- else -}}
{{- .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "dockerHubMirror" -}}
{{- if .Values.use_alternate_registry -}}
{{- .Values.global.dockerHubMirrorAlternateRegion -}}
{{- else -}}
{{- .Values.global.dockerHubMirror -}}
{{- end -}}
{{- end -}}

{{- define "rabbitmq_maintenance_affinity" }}
          - weight: 1
            preference:
              matchExpressions:
              - key: cloud.sap/maintenance-state
                operator: In
                values:
                - operational
{{- end }}

{{- define "rabbitmq_node_reinstall_affinity" }}
          - weight: 1
            preference:
              matchExpressions:
              - key: cloud.sap/deployment-state
                operator: NotIn
                values:
                - reinstalling
{{- end }}
