class PopoverController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    @choices = ['Choice 1', 'Choice 2', 'Choice 3']
    @choices2 = %w(Alpha Beta Gamma)

    @button = PopoverButtonView.alloc.initWithFrame([[10,10],[80,40]], position: :bottom)
    @button.popover_values = @choices
    @button.layer.setBorderWidth(1.0)
    @button.layer.setCornerRadius(8.0)
    @button.layer.setBorderColor(UIColor.grayColor.CGColor)
    @button.setTitle(@choices[0], forState: UIControlStateNormal)
    @button.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
    @button.delegate = self
    self.view.addSubview @button

    @button2 = PopoverButtonView.alloc.initWithFrame([[50,200],[80,40]], position: :top)
    @button2.layer.setBorderWidth(1.0)
    @button2.layer.setCornerRadius(8.0)
    @button2.layer.setBorderColor(UIColor.grayColor.CGColor)
    @button2.popover_values = @choices2
    @button2.setTitleColor(UIColor.redColor, forState: UIControlStateNormal)
    @button2.delegate = self
    self.view.addSubview @button2

  end

  def popoverButtonView(popoverButtonView, valueDidChange: new_value)
    puts "New value: #{new_value}"
  end

end