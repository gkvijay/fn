package api

const (
	// Gin Request context key names
	AppName string = "app_name"
	AppID   string = "app_id"
	Path    string = "path"
	Func    string = "func"

	// Gin  URL template parameters
	ParamAppID     string = "appID"
	ParamAppName   string = "appName"
	ParamRouteName string = "route"
	ParamTriggerID string = "triggerID"
	ParamCallID    string = "call"
	ParamFnID      string = "fnId"

	//
	ParamSource string = "source"
)
