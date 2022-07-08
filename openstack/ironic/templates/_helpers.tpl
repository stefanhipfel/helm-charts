{{- define "ironic_db_migration_name" -}}
ironic-db-migration{{ if .Values.proxysql.mode }}-{{ .Values.proxysql.mode | replace "_" "-" }}{{ end }}
{{- end }}

{{- define "ironic_inspector_db_migration_name" -}}
ironic-inspector-db-migration{{ if .Values.proxysql.mode }}-{{ .Values.proxysql.mode | replace "_" "-" }}{{ end }}
{{- end }}

