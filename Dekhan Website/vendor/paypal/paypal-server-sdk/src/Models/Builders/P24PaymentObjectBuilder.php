<?php

declare(strict_types=1);

/*
 * PaypalServerSdkLib
 *
 * This file was automatically generated by APIMATIC v3.0 ( https://www.apimatic.io ).
 */

namespace PaypalServerSdkLib\Models\Builders;

use Core\Utils\CoreHelper;
use PaypalServerSdkLib\Models\P24PaymentObject;

/**
 * Builder for model P24PaymentObject
 *
 * @see P24PaymentObject
 */
class P24PaymentObjectBuilder
{
    /**
     * @var P24PaymentObject
     */
    private $instance;

    private function __construct(P24PaymentObject $instance)
    {
        $this->instance = $instance;
    }

    /**
     * Initializes a new p24 payment object Builder object.
     */
    public static function init(): self
    {
        return new self(new P24PaymentObject());
    }

    /**
     * Sets name field.
     */
    public function name(?string $value): self
    {
        $this->instance->setName($value);
        return $this;
    }

    /**
     * Sets email field.
     */
    public function email(?string $value): self
    {
        $this->instance->setEmail($value);
        return $this;
    }

    /**
     * Sets country code field.
     */
    public function countryCode(?string $value): self
    {
        $this->instance->setCountryCode($value);
        return $this;
    }

    /**
     * Sets payment descriptor field.
     */
    public function paymentDescriptor(?string $value): self
    {
        $this->instance->setPaymentDescriptor($value);
        return $this;
    }

    /**
     * Sets method id field.
     */
    public function methodId(?string $value): self
    {
        $this->instance->setMethodId($value);
        return $this;
    }

    /**
     * Sets method description field.
     */
    public function methodDescription(?string $value): self
    {
        $this->instance->setMethodDescription($value);
        return $this;
    }

    /**
     * Initializes a new p24 payment object object.
     */
    public function build(): P24PaymentObject
    {
        return CoreHelper::clone($this->instance);
    }
}
