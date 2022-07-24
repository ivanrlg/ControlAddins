page 57100 "Page With WebPageviewer"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Embedded Web")
            {
                usercontrol(MyWebControl1; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = All;
                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        Message('Ready %1', callbackUrl);

                        CurrPage.MyWebControl1.Navigate('https://ivansinglenton.dev');
                    end;

                    trigger DocumentReady()
                    begin
                        Message('Document ready');
                    end;

                    trigger Refresh(callbackUrl: Text)
                    begin
                        Message('Refresh %1', callbackUrl);
                    end;

                    trigger Callback(data: Text)
                    begin
                        Message('Callback %1', data);
                    end;
                }
            }

            group("Test Javascript")
            {
                group(Input)
                {
                    field(InputText; InputText)
                    {
                        ApplicationArea = All;
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            CurrPage.MyWebControl2.SetContent(InputText);
                        end;
                    }
                }
                group(Ouput)
                {

                    usercontrol(MyWebControl2; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                    {
                        ApplicationArea = All;
                    }
                }
            }

            group("Embedded Video")
            {
                usercontrol(MyWebControl3; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = All;
                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        Message('Ready %1', callbackUrl);

                        CurrPage.MyWebControl3.Navigate('https://ivansinglenton.dev');
                    end;
                }
            }

        }
    }

    actions
    {
        area(processing)
        {
            action(Navigate)
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    CurrPage.MyWebControl1.Navigate('https://ivansinglenton.dev');
                end;
            }
            action("Links in new window")
            {
                ApplicationArea = All;
                trigger OnAction();
                begin
                    CurrPage.MyWebControl1.LinksOpenInNewWindow();
                    CurrPage.MyWebControl1.SetContent('<a href="https://ivansinglenton.dev/?p=1541">How to send Telemetry using Azure IoT</a>');
                end;
            }
        }
    }

    var
        InputText: Text;
}