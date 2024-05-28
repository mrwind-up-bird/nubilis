<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::createDatabase('demo');
        Schema::create('demo.companies', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('street');
            $table->string('zipcode');
            $table->string('city');
            $table->string('country', 3);
            $table->string('phone')->nullable();
            $table->string('fax')->nullable();
            $table->string('website')->nullable();
            $table->string('email')->unique()->nullable();

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });

        Schema::create('demo.users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('surname');
            $table->string('street');
            $table->string('zipcode');
            $table->string('city');
            $table->foreignId('company_id')->nullable()->constrained('companies');

            $table->string('phone')->nullable();
            $table->string('mobile')->nullable();
            $table->string('fax')->nullable();
            $table->string('website')->nullable();

            $table->string('county')->nullable();
            $table->string('country');
            $table->string('language', 10);

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });

        Schema::create('demo.logins', function (Blueprint $table) {
            $table->id();
            $table->string('login')->unique();
            $table->string('password');
            $table->string('email')->unique();
            $table->foreignId('user_id')->constrained('users');

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });

        Schema::create('demo.payments', function (Blueprint $table) {
            $table->id();
            $table->integer('type');
            $table->foreignId('user_id')->constrained('users');
            $table->bigInteger('card_number')->nullable();
            $table->string('account_holder')->nullable();
            $table->integer('cvv')->nullable();
            $table->dateTime('valid_until')->nullable();
            $table->string('provider')->nullable();
            $table->string('iban')->nullable();
            $table->string('bic', 11)->nullable();
            $table->string('blz', 8)->nullable();
            $table->bigInteger('account')->nullable();

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });

        Schema::create('demo.payment_transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('payment_id')->constrained('payments');
            $table->integer('type');
            $table->string('transaction_id')->unique();
            $table->json('payment_data');

            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('demo.payment_transactions');
        Schema::dropIfExists('demo.payments');
        Schema::dropIfExists('demo.logins');
        Schema::dropIfExists('demo.users');
        Schema::dropIfExists('demo.companies');
    }
};
