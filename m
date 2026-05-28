Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE114317171
	for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976868; cv=none; b=iHzVAjMJFlFqP95Xwz+SSBNkAalZtc531Qps+vJw/Nxh7CoEualObo7Tno7aK1qpHL31eJkqTryPNbDCxH7ELxh9HI7qn+UjTyx5nbmhqWYeeqebP5FB5YKW3d8ruP8yfumdv2tO841ueEBTcfNwGjgnt7Me0xU1j3O/iwasOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976868; c=relaxed/simple;
	bh=5q4ipGt3rz+XOPxQCYOXCzSu3rdUI9tIlqLjN5BiaDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYrDB72E0hhCxa9lDiaxWozdYg5whUT7i0eF3rzhzvhZlDG/AJ4ma171m/UO0vaCgta3i0TelckNj2T9CSKDdGkESMKC4Q0N3f4UTUtEb2gp0w7IH949P+XRtch2vs4+qGNscG9WyLA+2equ9fNU5cGMcIYORc4i+ugX3LS3tEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QCBtZeMs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QCBtZeMs"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso21776908a12.3
        for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779976865; x=1780581665; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5q4ipGt3rz+XOPxQCYOXCzSu3rdUI9tIlqLjN5BiaDk=;
        b=QCBtZeMsFP2eu/pb+5BxC/4QVyKjrztI2QXMtDMS3bWi5Ufw9jy1jjLxYOQLUaBnnk
         UOFasH/f111tlfsVWM9XzJ/0D40OcYOU24+TolFfNKzrkGKzX0M+sNRqVCylkpUw7JX0
         Bpt2sKkqliOY7ZmNIaFhWTuJIW6/iVr7bnU2xg95Ah8zwv38JTVTzVe/k7qV6cipaxPV
         pc2J1BLrSPQQBgl1k6rbIXR6Tx4WOhwbRnUSWSsiYGhDwVu8ScpZ0GyB1pn4Ted1yt7a
         uP0s4I+KXXpwWEzzXGD6r1BaRUBcPEATVUDQ/+eXQgqLyGrpeMNbsDyGR6ItjfwFytnA
         uGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976865; x=1780581665;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5q4ipGt3rz+XOPxQCYOXCzSu3rdUI9tIlqLjN5BiaDk=;
        b=Sx/SGNiCl3WOakLOYTT9+Ma80sZBE1LwSICqx2Eg06Z/qLb0z42HBuehv5t1Fu2SGT
         2ftYAR2wMx2vCHWP22Pjy9Mg4Yc61LGXMb4mCTg8tv2xpaFWYt8fDj+QqZz7hLB41Y6d
         1W7ipcGoXktwZkJ0g3gz3SoU5wKtfG1hpNbnKdwKakc7SpWfJ8rpvNwmGbwI/2Q33yOw
         p+ztPUJJiOTVN/GbKjJZCBnjyE5YXb5iXFH+y2nSHPPuQBPKHG0G7GPI59xMPJWiktQU
         9PgSofwC0Df26qFDtAuhrJtqpNryDYKDNX8m1Pl2QvYGUEU0+6dggvv3k+7oiQmCDnnD
         uPwA==
X-Forwarded-Encrypted: i=1; AFNElJ/fVAWdA4Bm7drZiLZz5yhdOK/wj8DYiXYAwWxspS9BhuENHTxT0MPvnl43wk0OXfPeDnkE8Jce4SzW@lists.linux.dev
X-Gm-Message-State: AOJu0YxR3pt+aWSzMd9DH83QaJENLMblpO+j/E0SOmXbzXJbuHYWEA4a
	z/YdH/WmxH4FswqrY5DYtU/rB+JZGflcm52MBvVOQDAjhrAs++LlU+wOx4eZ754TDRs=
X-Gm-Gg: Acq92OFlfDKV2P4rNNpwx/DqFnx2zdaP5t7qJeCAobhKvJhGulBnImY/qOuRTgHv56R
	1t8pJeIdgRT5GSolPKjzBeAeeoChjS5dgMkGkSJeN7IeE+qlUFt7FjzkO+5ncF+ojy5LTFAQt5S
	jCEo64AvMWBcnfZJKi3io10+nAw+glvEw5GR8aQRQCJn8yH28FRQ1pNt1aSfo7Df0vsKNiB/tJO
	HodSgmxj7JvrsWjzLpH0kJzFSbJxZeqR2V8sPsvmHEX/FaTUh75F5yT1P+03pS9OYkiixz2hdIo
	9DrN8L+pbtvVVOmBgmPyxnLQ+8QAtldWCTsClUqQI9j9Kj6F2BM3oAAdfk8/BGIWVus+EIDF+06
	3EmWzrJBOZCTBEbqgsAAIFOaG6qAI+dj9HeQpqG7uUvFxLPamGcu6VKZnCpKPuozDGC5+LlnBMB
	/jx7PbV0SBpJsEGZtJioAVGVDhx90Fa+jcdJTc3+s2pZplLSwQDG3d7gRuhw1dKjwUxjyUypsZ7
	NbjbjmXqeMRboEoUeV7dH/WGf8P/Z6Q3WjZg9Q3FJLmd7b7YwRI+rUnARo1lzqk7mjPQgsLgUc=
X-Received: by 2002:a17:907:d411:b0:bd8:1537:d63f with SMTP id a640c23a62f3a-bdd267c9cadmr1734540566b.37.1779976864889;
        Thu, 28 May 2026 07:01:04 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d70a5sm733046766b.48.2026.05.28.07.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 07:01:03 -0700 (PDT)
Message-ID: <42c09b16-4ecd-423b-97c8-81f9a8a795c6@suse.com>
Date: Thu, 28 May 2026 16:01:03 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>
References: <20260528113605.267111-1-jgross@suse.com>
 <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com> <ahg-bEiwyqYTdWOD@google.com>
 <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com> <ahhBQDvyzHQfTCBD@google.com>
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
In-Reply-To: <ahhBQDvyzHQfTCBD@google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IEIQAOLCSNY1Tn5DbxtpbxfM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IEIQAOLCSNY1Tn5DbxtpbxfM
Content-Type: multipart/mixed; boundary="------------O7ouSul0GPGrql08ucZPrnMq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>
Message-ID: <42c09b16-4ecd-423b-97c8-81f9a8a795c6@suse.com>
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
References: <20260528113605.267111-1-jgross@suse.com>
 <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com> <ahg-bEiwyqYTdWOD@google.com>
 <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com> <ahhBQDvyzHQfTCBD@google.com>
In-Reply-To: <ahhBQDvyzHQfTCBD@google.com>

--------------O7ouSul0GPGrql08ucZPrnMq
Content-Type: multipart/mixed; boundary="------------qwXw0vIWRjD1LVN0z6qiZ3OT"

--------------qwXw0vIWRjD1LVN0z6qiZ3OT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDUuMjYgMTU6MjEsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6DQo+IE9uIFRo
dSwgTWF5IDI4LCAyMDI2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjguMDUuMjYg
MTU6MDksIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6DQo+Pj4gT24gVGh1LCBNYXkgMjgs
IDIwMjYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IFBsZWFzZSBkaXNyZWdhcmQgdGhp
cyBzZXJpZXMsIHRoZXJlIGlzIG9uZSBjb21wbGljYXRpb24gc2FzaGlrbyBtYWRlIG1lDQo+
Pj4+IGF3YXJlIG9mLg0KPj4+DQo+Pj4gU2FzaGlrbyBiZWF0IG1lIHRvIHRoZSBwdW5jaC4g
Oi0pDQo+Pj4NCj4+PiBTZWUgY29tbWl0IDIzNjgwNDhiZjVjMiAoIktWTTogeDg2OiBTaWdu
YWwgI0dQLCBub3QgLUVQRVJNLCBvbiBiYWQgV1JNU1IoTUNpX0NUTC9TVEFUVVMpIikNCj4+
PiBmb3IgYSByZWFsIHdvcmxkIGV4YW1wbGUgb2YgaG93IHRoaW5ncyBjYW4gYW5kIHdpbGwg
Z28gd3JvbmcuDQo+Pg0KPj4gWWVhaCwgd2l0aCBTYXNoaWtvJ3MgcG9pbnRlciBpdCB3YXMg
ZWFzeSB0byBzcG90Lg0KPj4NCj4+IFF1ZXN0aW9uIG5vdyBpcyB3aGV0aGVyIHRoZSBhbHJl
YWR5IGV4aXN0aW5nIGNhc2VzIG9mIC1lcnJubyBwYXNzZWQgYXMgcmV0dXJuDQo+PiB2YWx1
ZSBhcmUgd3Jvbmcgb3Igb24gcHVycG9zZS4NCj4gDQo+IFdoYXQgYXJlIHRoZSBleGlzdGlu
ZyBjYXNlcz8NCg0KSGF2ZSBhIGxvb2sgYXQ6DQoNCmt2bV9odl9tc3JfZ2V0X2NyYXNoX2Rh
dGEoKQ0Ka3ZtX2h2X21zcl9zZXRfY3Jhc2hfZGF0YSgpDQpzdm1fZ2V0X21zcigpDQpzdm1f
c2V0X21zcigpDQoNCg0KSnVlcmdlbg0K
--------------qwXw0vIWRjD1LVN0z6qiZ3OT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qwXw0vIWRjD1LVN0z6qiZ3OT--

--------------O7ouSul0GPGrql08ucZPrnMq--

--------------IEIQAOLCSNY1Tn5DbxtpbxfM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoYSp8FAwAAAAAACgkQsN6d1ii/Ey+H
zQgAjjEgj1vdPJoq/Exec0qyrfnc9E6ayRjHu9bQxxB2sF7asCvPKRRMFZrIJ4uLklbCrhg3XhPw
7YyYrlav2cRv2wDc7ODHM5V9kQJ16Tn5QCSW5PKyErmyXf74IwVb8d9+j2TMW9AkplgFkahoq+TF
o+cdaJrMzYtxMyJ31tAqCW3kGTRwUt9cNGmkELq2K8/27noSbhY8k07S2X8rWERLi2CqSlktMSq9
yXiup4I5yLNFuIZioKZzv86BD7T99Nykrc7mQP5ZNjrMs9Jmw68qMTQod7ljKhMCkVd5MBsjGJAq
IIbVZ4u+0i5i9MGrwa15wTfjItlbh1hjyRcV2Vy3Bw==
=+QFv
-----END PGP SIGNATURE-----

--------------IEIQAOLCSNY1Tn5DbxtpbxfM--
