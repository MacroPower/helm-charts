{{/*
Renders the prometheusRule objects required by the chart.
*/}}
{{- define "bjw-s.common.render.prometheusRules" -}}
  {{- /* Generate named services as required */ -}}
  {{- range $name, $prometheusRule := .Values.prometheusRule -}}
    {{- if $prometheusRule.enabled -}}
      {{- $prometheusRuleValues := $prometheusRule -}}

      {{- if and (not $prometheusRuleValues.nameOverride) (ne $name "main") -}}
        {{- $_ := set $prometheusRuleValues "nameOverride" $name -}}
      {{- end -}}

      {{/* Include the prometheusRule class */}}
      {{- $_ := set $ "ObjectValues" (dict "prometheusRule" $prometheusRuleValues) -}}
      {{- include "bjw-s.common.class.prometheusRule" $ | nindent 0 -}}
      {{- $_ := unset $.ObjectValues "prometheusRule" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
