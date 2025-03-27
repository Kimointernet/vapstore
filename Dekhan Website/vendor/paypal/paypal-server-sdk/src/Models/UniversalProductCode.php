<?php

declare(strict_types=1);

/*
 * PaypalServerSdkLib
 *
 * This file was automatically generated by APIMATIC v3.0 ( https://www.apimatic.io ).
 */

namespace PaypalServerSdkLib\Models;

use stdClass;

/**
 * The Universal Product Code of the item.
 */
class UniversalProductCode implements \JsonSerializable
{
    /**
     * @var string
     */
    private $type;

    /**
     * @var string
     */
    private $code;

    /**
     * @param string $type
     * @param string $code
     */
    public function __construct(string $type, string $code)
    {
        $this->type = $type;
        $this->code = $code;
    }

    /**
     * Returns Type.
     * The Universal Product Code type.
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * Sets Type.
     * The Universal Product Code type.
     *
     * @required
     * @maps type
     */
    public function setType(string $type): void
    {
        $this->type = $type;
    }

    /**
     * Returns Code.
     * The UPC product code of the item.
     */
    public function getCode(): string
    {
        return $this->code;
    }

    /**
     * Sets Code.
     * The UPC product code of the item.
     *
     * @required
     * @maps code
     */
    public function setCode(string $code): void
    {
        $this->code = $code;
    }

    /**
     * Encode this object to JSON
     *
     * @param bool $asArrayWhenEmpty Whether to serialize this model as an array whenever no fields
     *        are set. (default: false)
     *
     * @return array|stdClass
     */
    #[\ReturnTypeWillChange] // @phan-suppress-current-line PhanUndeclaredClassAttribute for (php < 8.1)
    public function jsonSerialize(bool $asArrayWhenEmpty = false)
    {
        $json = [];
        $json['type'] = UpcType::checkValue($this->type);
        $json['code'] = $this->code;

        return (!$asArrayWhenEmpty && empty($json)) ? new stdClass() : $json;
    }
}
