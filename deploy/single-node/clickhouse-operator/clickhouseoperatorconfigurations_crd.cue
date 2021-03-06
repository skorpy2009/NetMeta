package k8s

k8s: crds: "clickhouseoperatorconfigurations.clickhouse.altinity.com": spec: {
	group:   "clickhouse.altinity.com"
	version: "v1"
	scope:   "Namespaced"
	names: {
		kind:     "ClickHouseOperatorConfiguration"
		singular: "clickhouseoperatorconfiguration"
		plural:   "clickhouseoperatorconfigurations"
		shortNames: [
			"chopconf",
		]
	}
	additionalPrinterColumns: [{
		name:        "namespaces"
		type:        "string"
		description: "Watch namespaces"
		priority:    0 // show in standard view
		JSONPath:    ".status"
	}]
	// TODO return to this feature later
	// Pruning unknown fields. FEATURE STATE: Kubernetes v1.15
	// Probably full specification may be needed
	//  preserveUnknownFields: false
	validation: openAPIV3Schema: properties: spec: {
		type: "object"
		properties: {
			watchNamespaces: {
				type: "array"
				items: type: "string"
			}
			chCommonConfigsPath: type:              "string"
			chHostConfigsPath: type:                "string"
			chUsersConfigsPath: type:               "string"
			chiTemplatesPath: type:                 "string"
			statefulSetUpdateTimeout: type:         "integer"
			statefulSetUpdatePollPeriod: type:      "integer"
			onStatefulSetCreateFailureAction: type: "string"
			onStatefulSetUpdateFailureAction: type: "string"
			chConfigUserDefaultProfile: type:       "string"
			chConfigUserDefaultQuota: type:         "string"
			chConfigUserDefaultNetworksIP: {
				type: "array"
				items: type: "string"
			}
			chConfigUserDefaultPassword: type: "string"
			chUsername: type:                  "string"
			chPassword: type:                  "string"
			chPort: {
				type:    "integer"
				minimum: 1
				maximum: 65535
			}
			logtostderr: type:      "string"
			alsologtostderr: type:  "string"
			v: type:                "string"
			stderrthreshold: type:  "string"
			vmodule: type:          "string"
			log_backtrace_at: type: "string"
		}
	}
}
