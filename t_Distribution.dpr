program t_Distribution;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.M2 in '_LIBRARY\LUXOPHIA\LUX\LUX.M2.pas',
  LUX.M3 in '_LIBRARY\LUXOPHIA\LUX\LUX.M3.pas',
  LUX.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.M4.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.M4.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D2.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.V4.pas',
  LUX.D3.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.M4.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.D3.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.V4.pas',
  LUX.D4.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.M4.pas',
  LUX.D4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.pas',
  LUX.D4.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.V4.pas',
  LUX.D5 in '_LIBRARY\LUXOPHIA\LUX\LUX.D5.pas',
  LUX.DN in '_LIBRARY\LUXOPHIA\LUX\LUX.DN.pas',
  LUX.Math.Special.Gamma.Ooura in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Special.Gamma.Ooura.pas',
  LUX.Math.Special in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Special.pas',
  LUX.Math.Distribution in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Distribution.pas',
  LUX.Math.Special.Beta in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Special.Beta.pas',
  LUX.Math.Special.Gamma.Lanczos in '_LIBRARY\LUXOPHIA\LUX\» Math\LUX.Math.Special.Gamma.Lanczos.pas',
  LUX.Chart.Viewer in '_LIBRARY\LUXOPHIA\LUX.Chart\FMX\LUX.Chart.Viewer.pas' {ChartViewer: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
