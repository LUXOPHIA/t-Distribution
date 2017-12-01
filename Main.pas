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
        LabelCDc: TLabel;
          LabelCD: TLabel;
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
    _MouseP :Double;
    _MinP   :Single;
    _MaxP   :Single;
    ///// メソッド
    procedure MakeCharts;
  public const
    _DivN :Cardinal = 128;
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
     _CurvC := TChartCurv.Create( ChartViewer1 );
     _CurvT := TChartCurv.Create( ChartViewer1 );
     _Poin  := TChartPoin.Create( ChartViewer1 );

     with _CurvI do
     begin
          PoinsN := _DivN+1;

          with Stroke do
          begin
               Thickness := 6;
               Color     := $FFa3a3ff;
          end;
     end;

     with _CurvC do
     begin
          PoinsN := _DivN+1;

          with Stroke do
          begin
               Thickness := 2;
               Color     := $FFFFFFFF;
          end;
     end;

     with _CurvT do
     begin
          PoinsN := _DivN+1;

          with Stroke do
          begin
               Thickness := 4;
               Color     := $FF77ba77;
          end;
     end;

     with _Poin do
     begin
          Radius := 6;

          with Filler do
          begin
               Color := $FFf28f8f;
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

          for I := 0 to _DivN do
          begin
               P.X := ( MaxX - MinX ) * I / _DivN + MinX;

               P.Y := DistT( P.X, _FreeD );

               _CurvT[ I ] := TSingle2D( P );

               P.Y := CumDistT( P.X, _FreeD );

               _CurvC[ I ] := TSingle2D( P );

               P.X := InvCumDistT( P.Y, _FreeD );

               _CurvI[ I ] := TSingle2D( P );
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.CalcPoin;
var
   P :TDouble2D;
begin
     _MouseP := Clamp( _MouseP, _MinP, _MaxP );

     P.X := InvCumDistT( _MouseP, _FreeD );
     P.Y :=              _MouseP          ;

     LabelPP.Text := FloatToStrP( P.X, 8 );
     LabelCD.Text := FloatToStr ( P.Y, 8 );

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

     LabelFD.Text := FloatToStr( _FreeD, 8 );

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
   N, I :Integer;
   P :Double;
   S :String;
begin
     with Memo1 do
     begin
          BeginUpdate;

          with Lines do
          begin
               Clear;

               S := 'P';
               for N := 0 to 10 do S := S + '	' + 'ν=' + IntToStr( BinPow( N ), 4, ' ' );
               Add( S );

               for I := 0 to DivN do
               begin
                    P := ( MaxP - MinP ) / DivN * I + MinP;

                    S := FloatToStr( P, 8 );
                    for N := 0 to 10 do S := S + '	' + FloatToStr( InvCumDistT( P, BinPow( N ) ), 8 );
                    Add( S );
               end;
          end;

          EndUpdate;

          SelectAll;
          SetFocus;
     end;
end;

end. //#########################################################################
