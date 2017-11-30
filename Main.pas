unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls,
  LUX.Chart.Viewer,
  LUX, LUX.D1, LUX.D2,
  LUX.Math.Distribution;

type
  TForm1 = class(TForm)
    ChartViewer1: TChartViewer;
    Panel1: TPanel;
      ScrollBar1: TScrollBar;
      Panel2: TPanel;
        LabelFDc: TLabel;
          LabelFD: TLabel;
        LabelPPc: TLabel;
          LabelPP: TLabel;
        LabelCPc: TLabel;
          LabelCP: TLabel;
        Button1: TButton;
      Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ChartViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure ChartViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure ChartViewer1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Button1Click(Sender: TObject);
  private
    { private 宣言 }
    _MouseS :TShiftState;
    _MouseP :Single;
    _MinP   :Single;
    _MaxP   :Single;
    ///// メソッド
    procedure MakeCharts;
  public
    { public 宣言 }
    _FreeD :Double;
    _CurvT :TChartCurv;
    _CurvC :TChartCurv;
    _CurvI :TChartCurv;
    _Poin  :TChartPoin;
    ///// メソッド
    procedure CalcCurvs;
    procedure CalcPoin;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.Math;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TForm1.MakeCharts;
begin
          _CurvI := TChartCurv.Create( ChartViewer1 );
     with _CurvI do
     begin
          PoinsN := 100;

          with Stroke do
          begin
               Thickness := 6;
               Color     := $FF8585ff;
          end;
     end;

          _CurvC := TChartCurv.Create( ChartViewer1 );
     with _CurvC do
     begin
          PoinsN := 100;

          with Stroke do
          begin
               Thickness := 2;
               Color     := $FFFFFFFF;
          end;
     end;

          _CurvT := TChartCurv.Create( ChartViewer1 );
     with _CurvT do
     begin
          PoinsN := 100;

          with Stroke do
          begin
               Thickness := 4;
               Color     := $FFff8787;
          end;
     end;

          _Poin := TChartPoin.Create( ChartViewer1 );
     with _Poin do
     begin
          Radius := 6;

          with Filler do
          begin
               Color := $FF808080;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TForm1.CalcCurvs;
var
   I :Integer;
   P :TDouble2D;
begin
     with ChartViewer1 do
     begin
          _MinP := CumDistT( MinX, _FreeD );
          _MaxP := CumDistT( MaxX, _FreeD );
     end;

     for I := 0 to _CurvI.PoinsN-1 do
     begin
          with ChartViewer1 do
          begin
               P.X := ( MaxX - MinX ) / (_CurvT.PoinsN-1) * I + MinX;

               P.Y := CumDistT( P.X, _FreeD );
               P.X := InvCumDistT( P.Y, _FreeD );
          end;

          _CurvI[ I ] := TSingle2D( P );
     end;

     for I := 0 to _CurvC.PoinsN-1 do
     begin
          with ChartViewer1 do
          begin
               P.X := ( MaxX - MinX ) / (_CurvT.PoinsN-1) * I + MinX;
               P.Y := CumDistT( P.X, _FreeD );
          end;

          _CurvC[ I ] := TSingle2D( P );
     end;

     for I := 0 to _CurvT.PoinsN-1 do
     begin
          with ChartViewer1 do
          begin
               P.X := ( MaxX - MinX ) / (_CurvT.PoinsN-1) * I + MinX;
               P.Y := DistT( P.X, _FreeD );
          end;

          _CurvT[ I ] := TSingle2D( P );
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.CalcPoin;
var
   P :TDouble2D;
begin
     if _MouseP < _MinP then _MouseP := _MinP
                        else
     if _MaxP < _MouseP then _MouseP := _MaxP;

     P.X := InvCumDistT( _MouseP, _FreeD );
     P.Y := _MouseP;

     LabelCP.Text := P.Y.ToString;
     LabelPP.Text := P.X.ToString;

     _Poin.Pos := TSingle2D( P );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     with ChartViewer1 do
     begin
          MinX := -5;  MaxX := +5;
          MinY :=  0;  MaxY :=  1;

          ScaXs[ 0 ].Interv := 1/5;
          ScaXs[ 1 ].Interv := 1  ;
     end;

     MakeCharts;

     _MouseS := [];
     _MouseP := 0.5;

     ScrollBar1Change( Sender );
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     /////
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
     _FreeD := Power( 10, ScrollBar1.Max - ScrollBar1.Value );

     LabelFD.Text := _FreeD.ToString;

     CalcCurvs;
     CalcPoin;

     ChartViewer1.Repaint;
end;

//------------------------------------------------------------------------------

procedure TForm1.ChartViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseS := Shift;

     ChartViewer1MouseMove( Sender, Shift, X, Y );
end;

procedure TForm1.ChartViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
     if ssLeft in _MouseS then
     begin
          _MouseP := ChartViewer1.ScrToPosY( Y );

          CalcPoin;

          ChartViewer1.Repaint;
     end;
end;

procedure TForm1.ChartViewer1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     ChartViewer1MouseMove( Sender, Shift, X, Y );

     _MouseS := [];
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
const
     MinP :Double  = 0 + DOUBLE_EPS3;
     MaxP :Double  = 1 - DOUBLE_EPS3;
     DivN :Integer = 1000;
var
   I :Integer;
   P :Double;
begin
     with Memo1 do
     begin
          BeginUpdate;

          with Lines do
          begin
               Clear;

               Add( 'P'
                  + '	' + 'ν=   1'
                  + '	' + 'ν=   2'
                  + '	' + 'ν=   4'
                  + '	' + 'ν=   8'
                  + '	' + 'ν=  16'
                  + '	' + 'ν=  32'
                  + '	' + 'ν=  64'
                  + '	' + 'ν= 128'
                  + '	' + 'ν= 256'
                  + '	' + 'ν= 512'
                  + '	' + 'ν=1024' );

               for I := 0 to DivN do
               begin
                    P := ( MaxP - MinP ) / DivN * I + MinP;

                    Add( P.ToString
                       + '	' + InvCumDistT( P,    1 ).ToString
                       + '	' + InvCumDistT( P,    2 ).ToString
                       + '	' + InvCumDistT( P,    4 ).ToString
                       + '	' + InvCumDistT( P,    8 ).ToString
                       + '	' + InvCumDistT( P,   16 ).ToString
                       + '	' + InvCumDistT( P,   32 ).ToString
                       + '	' + InvCumDistT( P,   64 ).ToString
                       + '	' + InvCumDistT( P,  128 ).ToString
                       + '	' + InvCumDistT( P,  256 ).ToString
                       + '	' + InvCumDistT( P,  512 ).ToString
                       + '	' + InvCumDistT( P, 1024 ).ToString );
               end;
          end;

          EndUpdate;

          SelectAll;
          SetFocus;
     end;
end;

end. //#########################################################################
