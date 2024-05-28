<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CompaniesTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('demo.companies')->insert([
            ['name' => 'Tech Solutions GmbH', 'street' => 'Musterstraße 1', 'zipcode' => '12345', 'city' => 'Berlin', 'country' => 'DE', 'phone' => '030123456', 'fax' => '030123457', 'website' => 'www.techsolutions.de', 'email' => 'info@techsolutions.de'],
            ['name' => 'Global Trade AG', 'street' => 'Handelsweg 5', 'zipcode' => '67890', 'city' => 'Hamburg', 'country' => 'DE', 'phone' => '040987654', 'fax' => '040987655', 'website' => 'www.globaltrade.de', 'email' => 'contact@globaltrade.de'],
            ['name' => 'Creative Works Ltd.', 'street' => 'Art Avenue 10', 'zipcode' => '54321', 'city' => 'Munich', 'country' => 'DE', 'phone' => '089654321', 'fax' => '089654322', 'website' => 'www.creativeworks.de', 'email' => 'support@creativeworks.de'],
            ['name' => 'Business Corp.', 'street' => 'Business Blvd 20', 'zipcode' => '90210', 'city' => 'Los Angeles', 'country' => 'US', 'phone' => '213987654', 'fax' => '213987655', 'website' => 'www.businesscorp.com', 'email' => 'info@businesscorp.com'],
            ['name' => 'Innovative Solutions Inc.', 'street' => 'Tech Street 15', 'zipcode' => '30301', 'city' => 'Atlanta', 'country' => 'US', 'phone' => '404987654', 'fax' => '404987655', 'website' => 'www.innovativesolutions.com', 'email' => 'contact@innovativesolutions.com'],
            ['name' => 'Future Tech LLC', 'street' => 'Innovation Road 7', 'zipcode' => '10001', 'city' => 'New York', 'country' => 'US', 'phone' => '212987654', 'fax' => '212987655', 'website' => 'www.futuretech.com', 'email' => 'info@futuretech.com'],
            ['name' => 'NextGen Enterprises', 'street' => 'NextGen Street 9', 'zipcode' => '90210', 'city' => 'San Francisco', 'country' => 'US', 'phone' => '415987654', 'fax' => '415987655', 'website' => 'www.nextgen.com', 'email' => 'support@nextgen.com'],
            ['name' => 'Global Innovations', 'street' => 'Innovation Plaza 3', 'zipcode' => '10101', 'city' => 'Boston', 'country' => 'US', 'phone' => '617987654', 'fax' => '617987655', 'website' => 'www.globalinnovations.com', 'email' => 'info@globalinnovations.com'],
            ['name' => 'Tech Pioneers Ltd.', 'street' => 'Pioneer Way 8', 'zipcode' => '94105', 'city' => 'San Francisco', 'country' => 'US', 'phone' => '415987654', 'fax' => '415987655', 'website' => 'www.techpioneers.com', 'email' => 'support@techpioneers.com'],
            ['name' => 'Alpha Tech Inc.', 'street' => 'Alpha Street 6', 'zipcode' => '60601', 'city' => 'Chicago', 'country' => 'US', 'phone' => '312987654', 'fax' => '312987655', 'website' => 'www.alphatech.com', 'email' => 'info@alphatech.com'],
            ['name' => 'Digital Solutions', 'street' => 'Digital Road 2', 'zipcode' => '20001', 'city' => 'Washington', 'country' => 'US', 'phone' => '202987654', 'fax' => '202987655', 'website' => 'www.digitalsolutions.com', 'email' => 'contact@digitalsolutions.com'],
            ['name' => 'Tech Innovators', 'street' => 'Innovator Lane 11', 'zipcode' => '73301', 'city' => 'Austin', 'country' => 'US', 'phone' => '512987654', 'fax' => '512987655', 'website' => 'www.techinnovators.com', 'email' => 'support@techinnovators.com'],
            ['name' => 'Beta Corp.', 'street' => 'Beta Street 4', 'zipcode' => '33101', 'city' => 'Miami', 'country' => 'US', 'phone' => '305987654', 'fax' => '305987655', 'website' => 'www.betacorp.com', 'email' => 'info@betacorp.com'],
            ['name' => 'Gamma Ltd.', 'street' => 'Gamma Avenue 12', 'zipcode' => '75201', 'city' => 'Dallas', 'country' => 'US', 'phone' => '214987654', 'fax' => '214987655', 'website' => 'www.gammaltd.com', 'email' => 'contact@gammaltd.com'],
            ['name' => 'Omega Enterprises', 'street' => 'Omega Blvd 19', 'zipcode' => '77001', 'city' => 'Houston', 'country' => 'US', 'phone' => '713987654', 'fax' => '713987655', 'website' => 'www.omegaenterprises.com', 'email' => 'support@omegaenterprises.com'],
            ['name' => 'Lambda Innovations', 'street' => 'Lambda Plaza 14', 'zipcode' => '85001', 'city' => 'Phoenix', 'country' => 'US', 'phone' => '602987654', 'fax' => '602987655', 'website' => 'www.lambdainnovations.com', 'email' => 'info@lambdainnovations.com'],
            ['name' => 'Sigma Solutions', 'street' => 'Sigma Street 17', 'zipcode' => '98101', 'city' => 'Seattle', 'country' => 'US', 'phone' => '206987654', 'fax' => '206987655', 'website' => 'www.sigmasolutions.com', 'email' => 'contact@sigmasolutions.com'],
            ['name' => 'Epsilon Corp.', 'street' => 'Epsilon Avenue 22', 'zipcode' => '63101', 'city' => 'St. Louis', 'country' => 'US', 'phone' => '314987654', 'fax' => '314987655', 'website' => 'www.epsilon.com', 'email' => 'support@epsilon.com'],
            ['name' => 'Delta Technologies', 'street' => 'Delta Road 25', 'zipcode' => '46201', 'city' => 'Indianapolis', 'country' => 'US', 'phone' => '317987654', 'fax' => '317987655', 'website' => 'www.deltatechnologies.com', 'email' => 'info@deltatechnologies.com'],
            ['name' => 'Zeta Tech', 'street' => 'Zeta Street 30', 'zipcode' => '30301', 'city' => 'Atlanta', 'country' => 'US', 'phone' => '404987654', 'fax' => '404987655', 'website' => 'www.zetatech.com', 'email' => 'contact@zetatech.com'],
        ]);
    }
}
