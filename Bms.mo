model Bms
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 12)  annotation(
    Placement(transformation(origin = {-44, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 2)  annotation(
    Placement(transformation(origin = {-8, 38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
    Placement(transformation(origin = {30, 36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {-8, -4}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-54, 38}, {-68, 38}, {-68, 6}, {-8, 6}}, color = {0, 0, 255}));
  connect(constantVoltage.p, resistor.p) annotation(
    Line(points = {{-34, 38}, {-18, 38}}, color = {0, 0, 255}));
  connect(resistor.n, currentSensor.p) annotation(
    Line(points = {{2, 38}, {20, 38}, {20, 36}}, color = {0, 0, 255}));
  connect(currentSensor.n, ground.p) annotation(
    Line(points = {{40, 36}, {42, 36}, {42, 6}, {-8, 6}}, color = {0, 0, 255}));

annotation(
    uses(Modelica(version = "4.0.0")));
end Bms;
