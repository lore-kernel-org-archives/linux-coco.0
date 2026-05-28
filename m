Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737423393B
	for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982616; cv=none; b=QtZdCaFzc+Q6+tLvIW0oAvFoVCm0VTIsBcRuxltWDXjYizru0qgXVfN6Ymt6D5d5l3MellKXZ/0Euwbnna+eTIJjiYBmuxUYTf3HrfnBMx937kvK4/bPAEKjyFtV6BunlNcPrBDMoFcPVgC+/iSn4Zz5D/pRIoBAOLC8lRzyqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982616; c=relaxed/simple;
	bh=sqW1HQx3LG6zgj6UX/t1m3898JYHqex8tB+gaTa8ke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0gtz/TLyFm3r6X+RXWfPkCsWWJfzTmkwNRQdB/Ldzx9t0NhqIbAihaE6zKNsaWvP2g1BwX2TfVxt0uH3k09BFm4X7gpPvK/QpkknzhK1sChEjmTidxzWDmUexSepf2MxYNFvlEsyNuDakwNUkXH6MSUsDXW6C/JB2FjvuVDoYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mz6dfvR3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mz6dfvR3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so1683747a12.1
        for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779982614; x=1780587414; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sqW1HQx3LG6zgj6UX/t1m3898JYHqex8tB+gaTa8ke8=;
        b=Mz6dfvR32wpIYF9bu7qswupkDZLE849VUvLah4tLfKoczA/m13Ea75/Ey8+ZCSltUg
         ZU4W1n8Dyi5KZHk3+J//Q4ZG/sPatxPRDI79dCjvaGmkzCMD3W7pPzFT8YNhX4fcSYyd
         +GTgzPCAuOW8kXXY1eOL+LUnikhS5Nx135laRjrj9wIY0r93qKRia28mqq5DBlxK6JqY
         zXYqGJCZc2nQPgUpfKvUrQu+PD/PzKMGyU0tvxWc7dlRsp2YCQgpsy4eGmSygj7AgbJT
         r7v/jWo/QL/+tTV8OR0JlyZys1ZyyGLat7GF4AdsyFvSwmuQXZSTterYs4UQ4tMqscU9
         peHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982614; x=1780587414;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqW1HQx3LG6zgj6UX/t1m3898JYHqex8tB+gaTa8ke8=;
        b=QzT1YzTbkG6ZWLO/gI1Ble4IqhFW4g7WjgLB35+L4pomypLCSRqQUUhCLAxJXixIin
         /VsMZcwJxdxJa7SF7znfloLenHEko1Uh5x7IeCShjZ3vC1AnIEnZb9pDfIgjl4gCcxxO
         xe2OwRE65a1STczamc3PBpZENHrLtIWrIUleokHjUwIU54iV+FBG4NG97/Qv6P/mqmQW
         roLxaVA5lQgyc0w7/qwGeFhfEsLSjwAHlubD5IHePBzBShRpG7T+PkykqUq9u/+cRGqa
         dB5yA9icG18uTM72MCgzefxvp1SBQTbhTxabqn5qU6OaSDcRHzwP+9Con7L/D0RHqraN
         WYXg==
X-Forwarded-Encrypted: i=1; AFNElJ9TGGsvh8yjIF89tjBDv/UT0AgbbZP7l1kDmE8QV28LVwjJNlvOyqtsLZqwU0SlqST3lmqYDGHHetNb@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd/E8OY2iDktW5ECRgLr82bQMIX+hNydItVll1iMHTq1uX/97T
	6R4W+DuIq7gtJYZdLE6URSR97oKDUp4375lqm6NlX3baF5KeqbFyLMiRrTf0imPu3Gw=
X-Gm-Gg: Acq92OHFhJSy/F797KEH8U/BrJQI1vPQD8zBfuD6TI1XMOWKe498Ex2mgnzvLD01A0l
	YBCBDKQelyDrmizHokRPak2mSrccj8qCtnZfIlbM7/Ml4+DRIp/8wK5fxqbBKAkYzoipGTh6vyM
	K8SIBwQMn+wiUOvos1nRrKCghoTlVBrBQwRf0rC/2nfcTUX+WVs++v1+bOb6G3W5NN0Qd1b34Vq
	7esHZR9RcIT4fofUKiFQcr8mXtldpiFLfKTL4HhZcmLEQIDA3wP0cj8C2GMK1ZgOBhcmKc+tRpg
	NT30C8iUydUOK8Dcdw2st2OnhmsspMEJuJM3QxF6hbB/M3MhgDkQUXynM0TCo4m6W1IiC42a7Cx
	VQsz8mAe3jUeYzrHnAcTdI62NsTmqyvJ69trkMtj99BRwlpHAqcya747IAjisGcxeunNT+w0TLk
	9JyEtXQnJcygWyAs4nENfB7JhtHpU6e+98rE3C/nCm6BQGHj8SlQwyl4ZSCArcD79Qirg0FVT1V
	XRAdFxu+oiP9GToKee0f8awI0CvLulSdGNomMutcgDCJi+dkyJwgm6QjOjULCfp
X-Received: by 2002:a17:907:267b:b0:bdc:6e26:a94 with SMTP id a640c23a62f3a-bdd1fe94160mr1232081066b.0.1779982614229;
        Thu, 28 May 2026 08:36:54 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc30508d7sm737475766b.18.2026.05.28.08.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 08:36:53 -0700 (PDT)
Message-ID: <747994a1-9a40-4363-ada0-54c3ed2620f8@suse.com>
Date: Thu, 28 May 2026 17:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
To: David Woodhouse <dwmw2@infradead.org>,
 Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Paul Durrant <paul@xen.org>
References: <20260528113605.267111-1-jgross@suse.com>
 <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com> <ahg-bEiwyqYTdWOD@google.com>
 <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com> <ahhBQDvyzHQfTCBD@google.com>
 <8d3f3cbe-89ca-44df-b35f-90c2724e9154@suse.com>
 <a6fdbcc655ea24209ed03e377f7e4a2a4d43bd9c.camel@infradead.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <a6fdbcc655ea24209ed03e377f7e4a2a4d43bd9c.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jBgPC0jz8eAmWQJRy9Zt0Fw5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jBgPC0jz8eAmWQJRy9Zt0Fw5
Content-Type: multipart/mixed; boundary="------------yCAVOxSHSBW11EyIoB1hvFRx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Paul Durrant <paul@xen.org>
Message-ID: <747994a1-9a40-4363-ada0-54c3ed2620f8@suse.com>
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
References: <20260528113605.267111-1-jgross@suse.com>
 <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com> <ahg-bEiwyqYTdWOD@google.com>
 <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com> <ahhBQDvyzHQfTCBD@google.com>
 <8d3f3cbe-89ca-44df-b35f-90c2724e9154@suse.com>
 <a6fdbcc655ea24209ed03e377f7e4a2a4d43bd9c.camel@infradead.org>
In-Reply-To: <a6fdbcc655ea24209ed03e377f7e4a2a4d43bd9c.camel@infradead.org>

--------------yCAVOxSHSBW11EyIoB1hvFRx
Content-Type: multipart/mixed; boundary="------------Y0INK8x0CNzbQAe4hYg0rJdH"

--------------Y0INK8x0CNzbQAe4hYg0rJdH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjYgMTc6MzIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVGh1LCAy
MDI2LTA1LTI4IGF0IDE2OjMzICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24g
MjguMDUuMjYgMTU6MjEsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6DQo+Pj4gT24gVGh1
LCBNYXkgMjgsIDIwMjYsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+IE9uIDI4LjA1LjI2
IDE1OjA5LCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCBNYXkg
MjgsIDIwMjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gUGxlYXNlIGRpc3JlZ2Fy
ZCB0aGlzIHNlcmllcywgdGhlcmUgaXMgb25lIGNvbXBsaWNhdGlvbiBzYXNoaWtvIG1hZGUg
bWUNCj4+Pj4+PiBhd2FyZSBvZi4NCj4+Pj4+DQo+Pj4+PiBTYXNoaWtvIGJlYXQgbWUgdG8g
dGhlIHB1bmNoLiA6LSkNCj4+Pj4+DQo+Pj4+PiBTZWUgY29tbWl0IDIzNjgwNDhiZjVjMiAo
IktWTTogeDg2OiBTaWduYWwgI0dQLCBub3QgLUVQRVJNLCBvbiBiYWQgV1JNU1IoTUNpX0NU
TC9TVEFUVVMpIikNCj4+Pj4+IGZvciBhIHJlYWwgd29ybGQgZXhhbXBsZSBvZiBob3cgdGhp
bmdzIGNhbiBhbmQgd2lsbCBnbyB3cm9uZy4NCj4+Pj4NCj4+Pj4gWWVhaCwgd2l0aCBTYXNo
aWtvJ3MgcG9pbnRlciBpdCB3YXMgZWFzeSB0byBzcG90Lg0KPj4+Pg0KPj4+PiBRdWVzdGlv
biBub3cgaXMgd2hldGhlciB0aGUgYWxyZWFkeSBleGlzdGluZyBjYXNlcyBvZiAtZXJybm8g
cGFzc2VkIGFzIHJldHVybg0KPj4+PiB2YWx1ZSBhcmUgd3Jvbmcgb3Igb24gcHVycG9zZS4N
Cj4+Pg0KPj4+IFdoYXQgYXJlIHRoZSBleGlzdGluZyBjYXNlcz8NCj4+DQo+PiBGb3VuZCBh
bm90aGVyIG9uZToNCj4+DQo+PiBrdm1feGVuX3dyaXRlX2h5cGVyY2FsbF9wYWdlKCkgKGNh
bGxlZCBieSBrdm1fc2V0X21zcl9jb21tb24oKSkNCj4gDQo+IFlvdSBtZWFuIGluIHRoZSBj
YXNlIHdoZXJlIGl0J3MgdXNpbmcgdGhlIHVzZXItcHJvdmlkZWQgaHlwZXJjYWxsIHBhZ2Us
DQo+IGFuZCBjYW4ndCBjb3B5IGZyb20gdGhlIGJ1ZmZlciB0aGF0IHRoZSBWTU0gcHJvdmlk
ZWQ/DQoNClllcy4NCg0KPiANCj4gSSB0aGluayB0aGF0J3MgY29ycmVjdCB0byByZXR1cm4g
LWVycm5vIHZpYSBQVFJfRVJSKCkgYW5kIGxldCB0aGUgZ3Vlc3QNCj4gZGllPw0KDQpJbiB0
aGlzIGNhc2UgSSB0aGluayBhIGNvbW1lbnQgaW4gdGhpcyByZWdhcmQgd291bGQgYmUgbmlj
ZSwgYXMgaXQgd291bGQNCnByZXZlbnQgb3RoZXJzIHN0dW1ibGluZyBvdmVyIGl0IGFza2lu
ZyB0aGUgc2FtZSBxdWVzdGlvbiBhZ2Fpbi4NCg0KDQpKdWVyZ2VuDQo=
--------------Y0INK8x0CNzbQAe4hYg0rJdH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Y0INK8x0CNzbQAe4hYg0rJdH--

--------------yCAVOxSHSBW11EyIoB1hvFRx--

--------------jBgPC0jz8eAmWQJRy9Zt0Fw5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoYYRUFAwAAAAAACgkQsN6d1ii/Ey+n
1Qf+K2anulNNi3n3aeQXiqLOZjLQ6ts+E8gX5F/j75b0upWUeO5Dx5rb+TqhJilK+6JvFNFYwv/V
qnYQq7OtVsceHeLCCoo6/IeXxQbN88KGUx0tD7iJdgxq2l2P/wNM/X7ndq6c6TDjWSjdtyuPMJZs
GTZTjMggE7QNlrJDzexShuwm+e3A5+GERkPOkauuldBWYGkgegpdf+Fl+nA3VCwsm0eDSseICU7o
+MBClovYz+vSyJz6qsW26uUakXqXggLyx/UYMoAobSMzt2jr4bMNnGUUFsv4AEqGRcVUQuGwYQ7N
4gcbKk9JwgunYj44NtcJZrEZ2AQUi72SJiNwK6yEMw==
=+oYF
-----END PGP SIGNATURE-----

--------------jBgPC0jz8eAmWQJRy9Zt0Fw5--
