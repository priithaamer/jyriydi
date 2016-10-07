class EstimoteController < UIViewController
  
  ESTIMOTE_PROXIMITY_UUID = NSUUID.alloc.initWithUUIDString("B9407F30-F5F8-466E-AFF9-25556B57FE6D")
  
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    
    image = UIImage.imageNamed('logo@2x.png')
    
    imageView = UIImageView.alloc.initWithImage(image)
    imageView.frame = [[128,480], [65,62]]
    self.view.addSubview(imageView)
    
    addLabels
    
    @beaconManager = ESTBeaconManager.alloc.init
    @beaconManager.delegate = self
    
    # Creates sample region object (you can additionaly pass major / minor values).
    #
    # We specify it using only the ESTIMOTE_PROXIMITY_UUID because we want to discover all
    # hardware beacons with Estimote's proximty UUID.
    @region = ESTBeaconRegion.alloc.initWithProximityUUID(ESTIMOTE_PROXIMITY_UUID, identifier: "EstimoteSampleRegion")
    
    # Starts looking for Estimote beacons.
    # All callbacks will be delivered to beaconManager delegate.
    @beaconManager.startRangingBeaconsInRegion(@region)
  end
  
  def viewDidDisappear(animated)
    @beaconManager.stopRangingBeaconsInRegion(@region)
  end

  # Delegate method invoked during ranging. Allows to retrieve NSArray of all discoverd beacons
  # represented with ESTBeacon objects.
  def beaconManager(manager, didRangeBeacons: beacons, inRegion: region)
    if beacons[0]
      @beacon1_name.text = "Majakas 1"
      @beacon1_distance.text = "%.2fm" % beacons[0].distance
    end
    if beacons[1]
      @beacon2_name.text = "Majakas 2"
      @beacon2_distance.text = "%.2fm" % beacons[1].distance
    end
    if beacons[2]
      @beacon3_name.text = "Majakas 3"
      @beacon3_distance.text = "%.2fm" % beacons[2].distance
    end
  end
  
  def addLabels
    
    font = UIFont.fontWithName('Avenir', size: 20.0)
    
    y = 60
    ystep = 60
    
    @beacon1_name = UILabel.alloc.initWithFrame([[20,y], [200,80]])
    @beacon1_name.font = font
    # @beacon1_name.text = "Sinine"
    self.view.addSubview(@beacon1_name)
    
    @beacon1_distance = UILabel.alloc.initWithFrame([[220,y], [80,80]])
    @beacon1_distance.font = font
    # @beacon1_distance.text = "0.5m"
    @beacon1_distance.textAlignment = UITextAlignmentRight
    self.view.addSubview(@beacon1_distance)
    
    y += ystep

    @beacon2_name = UILabel.alloc.initWithFrame([[20,y], [200,80]])
    @beacon2_name.font = font
    # @beacon2_name.text = "Teine sinine"
    self.view.addSubview(@beacon2_name)
    
    @beacon2_distance = UILabel.alloc.initWithFrame([[220,y], [80,80]])
    @beacon2_distance.font = font
    # @beacon2_distance.text = "0.5m"
    @beacon2_distance.textAlignment = UITextAlignmentRight
    self.view.addSubview(@beacon2_distance)
    
    y += ystep
    
    @beacon3_name = UILabel.alloc.initWithFrame([[20,y], [200,80]])
    @beacon3_name.font = font
    # @beacon3_name.text = "Kolmas sinine"
    self.view.addSubview(@beacon3_name)
    
    @beacon3_distance = UILabel.alloc.initWithFrame([[220,y], [80,80]])
    @beacon3_distance.font = font
    # @beacon3_distance.text = "0.5m"
    @beacon3_distance.textAlignment = UITextAlignmentRight
    self.view.addSubview(@beacon3_distance)
  end
end
