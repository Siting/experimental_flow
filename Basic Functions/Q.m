%% Flow-Density Function
function[q]=Q(density,vmax,dmax,dc)

q=vmax*density.*((0<density).*(density<=dc))+...
    (dc*vmax)*(dmax-density)./(dmax-dc).*((dmax>density).*(density>dc))+...
    0*(density>=dmax)+0*(density<=0);