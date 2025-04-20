model BatterySoCModel
  parameter Real C = 10 "Battery Capacity in Ah";
  Real SoC(start=1.0, min=0, max=1) "State of Charge (1 = 100%)";
  Real I "Current in Amps";
  Real Power "Power consumed by load in Watts";


  Modelica.Electrical.Analog.Basic.Resistor resistor(R=2) "Load resistor";
  Modelica.Electrical.Analog.Sources.ConstantVoltage voltageSource(V=12);
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor;

equation
  // Circuit connections
  connect(voltageSource.p, resistor.p);
  connect(resistor.n, currentSensor.p);
  connect(currentSensor.n, ground.p);
  connect(voltageSource.n, ground.p);

  // Current measurement
  I = currentSensor.i;
  Power = voltageSource.V * I;

  // SoC calculation
  der(SoC) = -I / C;

annotation(
  uses(Modelica(version="3.2.3")));
end BatterySoCModel;
