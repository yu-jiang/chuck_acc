bag = rosbag('vehicle_stationary_2021-08-31-10-50-17.bag');
bagSelect = select(bag, 'Topic', '/as_tx/objects');

msgs = readMessages(bagSelect,'DataFormat','struct');
imSelect = select(bag, 'Topic', '/usb_cam/image_raw/compressed');

%%
im_msg = readMessages(imSelect);
for ct = 1:numel(im_msg)
   frame = readImage(im_msg{ct});
   imshow(frame);
   drawnow
end

%%
figure(1)
for ct = 1:numel(msgs)
    obj = msgs{ct}.Objects;    
    for jj = 1:numel(obj)
        plot(obj(jj).Pose.Pose.Position.X, ...
        obj(jj).Pose.Pose.Position.Y, 'o');
        hold on
    end
    grid on
    hold off
    drawnow;    
end