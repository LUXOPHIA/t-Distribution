program t_Distribution;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.Chart.Viewer in '_LIBRARY\LUXOPHIA\LUX.Chart\_FMX\LUX.Chart.Viewer.pas' {ChartViewer: TFrame},
  LUX.D4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.pas',
  LUX.D4x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4x4.pas',
  LUX.D4x4x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4x4x4.pas',
  LUX.D5 in '_LIBRARY\LUXOPHIA\LUX\LUX.D5.pas',
  LUX.DN in '_LIBRARY\LUXOPHIA\LUX\LUX.DN.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D2x2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2x2.pas',
  LUX.D2x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2x4.pas',
  LUX.D2x4x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2x4x4.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.D3x3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3x3.pas',
  LUX.D3x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3x4.pas',
  LUX.D3x4x4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3x4x4.pas',
  LUX.Math.Distribution in '_LIBRARY\LUXOPHIA\LUX\Math\LUX.Math.Distribution.pas',
  LUX.Math.Special in '_LIBRARY\LUXOPHIA\LUX\Math\LUX.Math.Special.pas',
  LUX.Math.Special.Gamma.Lanczos in '_LIBRARY\LUXOPHIA\LUX\Math\Special\LUX.Math.Special.Gamma.Lanczos.pas',
  LUX.Math.Special.Gamma.Ooura in '_LIBRARY\LUXOPHIA\LUX\Math\Special\LUX.Math.Special.Gamma.Ooura.pas',
  LUX.Math.Special.Beta in '_LIBRARY\LUXOPHIA\LUX\Math\Special\LUX.Math.Special.Beta.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
