require "rails_helper"

RSpec.describe "Vehicles", type: :request do

  describe "GET /vehicles" do
    context "test return vehicles" do
      let(:vehicle) do
        Vehicle.create(car: "Celta", brand: "Chevrolet", year: 2002, description:"semi novo", sold: false) 
      end
      it "returns status 200" do
        vehicle
        get "/vehicles"
        expect(response.code).to eq "200"
        expect(JSON.parse(response.body)).to eq(
          [{"id" => 1,
            "car" => "Celta",
            "brand" => "Chevrolet",
            "year"=> 2002,
            "description" => "semi novo",
            "sold" => false,
            "created_at" => vehicle.created_at.as_json,
            "updated_at" => vehicle.updated_at.as_json
            }]
          )
        end
      end
    end
    
    describe "POST /vehicles" do
      context "test create vehicle" do
        it "returns status 201" do
          post "/vehicles", params:{
            "car" => "Celta",
            "brand" => "Chevrolet",
            "year"=> 2002,
            "description" => "semi novo",
            "sold" => false,
          }
          vehicle = Vehicle.first
          expect(response.code).to eq "201"
          expect(JSON.parse(response.body)).to eq(
            "id" => 1,
            "car" => "Celta",
            "brand" => "Chevrolet",
            "year"=> 2002,
            "description" => "semi novo",
            "sold" => false,
            "created_at" => vehicle.created_at.as_json,
            "updated_at" => vehicle.updated_at.as_json
          )
          
        end
      end  
    end
    
    describe "PUT /vehicles" do
      context "test update vehicle" do
        let(:vehicle) do
          Vehicle.create(car: "Celta", brand: "Chevrolet", year: 2000, description:"semi novo", sold: false) 
        end
        it "returns status 200" do
          put "/vehicles/#{vehicle.id}", params:{
            car: 'Celta',
            brand: 'Chevrolet',
            year: 2002,
            description:'usado',
            sold:true
          }
          vehicle = Vehicle.first
          expect(response.code).to eq "200"
          expect(JSON.parse(response.body)).to eq(
            "id" => 1,
            "car" => "Celta",
            "brand" => "Chevrolet",
            "year"=> 2002,
            "description" => "usado",
            "sold" => true,
            "created_at" => vehicle.created_at.as_json,
            "updated_at" => vehicle.updated_at.as_json
          )
        end
      end
    end
    
    describe "DELETE /vehicles" do
      context "test delete vehicle" do
        let(:vehicle) do
          Vehicle.create(car: "Celta", brand: "Chevrolet", year: 2002, description:"semi novo", sold: true) 
        end
        it "returns status 204" do
          delete "/vehicles/#{vehicle.id}"
          expect(response.status).to eq 204
        end
      end
    end
  end