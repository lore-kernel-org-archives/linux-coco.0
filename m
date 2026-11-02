Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620211;
	b=Co8jp8uDRamW/Q3S/FFlGEoo/gjA6Ya01vlcuaQ8VLaCxbW0hW2RIAFOolamVeWdjK+Z
	 +D8IXOAETjgYl9hGRhQ1t+JXVjWm0nilyBifEfJfPMBlrP1q2NcIey2n5CLTvU8cZ1I2j
	 PCjpElLk0kBsGXJR51fomVvDGYRsweifm41OtCGiSCDoNzd6EieM92UnL8seClbHf1Xlq
	 eaUtYMelAKNmBbNCNRSbAGGQABnpXNuPLjBw/pUWVxEgq1tCjyKKgGaFm9VQiuyl/BWkO
	 eUVp3mtJXLtVM6SyAfNIYrR6tlcvDuxxGELmWoHYK2AjhwLIw1n3ubYtO9cQdZxQVcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hXNwpOfasnHwc6KjgQ/k2VCbhXUjdGHEhgqik3iZ3MI=;
	b=AgnMPS+Yb2qfnfBk+pbQkcWOpqbz4F+jzqRQyoxejt2yY3G1U/ukZY0m74K3ULmLrjl6
	 KQ2cW2TpQjv1B2PJycO7zk/Y4nKLV8c+M6Myziobewu8KV+MGzJGBe0n22+j8POtBwcqk
	 bWmufP1z8KJ30202It/xHXao1mxOp0Qiek7SU81glNZbR60nVIfGuRClj/RC/lr0Ktuah
	 9zI/2t9FeCbYrhVPrvLYAXCumaVhi/FqqFnxN6Jwbl7URJmnEXYtoJqpWQzugXRBnLm4a
	 O6K4NQj1xNOfhjemKMAAUS9xFDJ75nt9ihZ/tsfIk+pn8BK6Y2nkOnvk/kGkWvpxP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=aS7T4DIR;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58E606A327
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C58E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=aS7T4DIR
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1724648f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 03:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793620208; x=1794225008; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXNwpOfasnHwc6KjgQ/k2VCbhXUjdGHEhgqik3iZ3MI=;
        b=aS7T4DIRLv7rVHRPWXbIR8op9gsfLZJ049XKkz82KRTstjJ0mvv6qOzoxtCojQOsJT
         d33H2wKAoXlwHQh1DUbFXXHFwcYyk56gwCMjbUfEiSxVFhVlMflfz5MgB2UG04Pq6Iz7
         et54ERJOwfyYLeInTUY3d2bjoAhS6mTyd6v36w90gV6Orh2fOGcs6lLGhwmMuCMIxpOB
         BAE89tgfUgdIUy96PbtXsZXEHMLcqHcAfK5HA7phEP0Fswfl9tBSpU1L3OG4m6dts6wQ
         YCUfkT2CwhPdoee+o7W0MZ+12Ks5uxoRuQ8QWJLerBa4y/tipghzcQjJFL4S0BXiZDOU
         Lm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620208; x=1794225008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXNwpOfasnHwc6KjgQ/k2VCbhXUjdGHEhgqik3iZ3MI=;
        b=tlmlXijbYtiUfgtI/t6r7e3YK4vQnmHoNqT9/BJ3eSXuMTneGi4WJqM9p2phI3MVh8
         FpP2MjOrSwmBiWPpqARU6ASzB6JsfoY7g05hs15mkSTpWxfhSgojVxaHVfmDLHZWiIho
         XvVdlx0kfDAYAR4Cj1cjAdbCAkcqoxQuX5KJQ+h6o2SsLdQUqzP9XTUjxOjW8Qx3s2EF
         Vet0YMWoGbHVPn7RihzMsFidzXD5G6A48wrbcP0PICYL+ASiWF7ZHTW5NQRHQPzwjcn6
         IcTicb1KjXxfuAj/rOAGEO8vI6n/ZDlMt6rEf21iyzojUgB+vxej/ENqk8drCTtNLo+A
         /Khw==
X-Gm-Message-State: APuU4Z9x7MWzml09g+KLdkzglOXdbn5L3SzjLlSALqu56jylJRaBGs0T
	+285oovGBxWZ5bEMPX85B7xkPDr2L24FTTuzW79Ru3qoHvhMTJB99zl2n1FBf6Yl8/8=
X-Gm-Gg: AYBFou1gBJ3jEOmEvRFZQjbZ20FQmrAGEpcOs01DKxVjeVg9+OUpIAPfbfgN5veMesA
	H/VDDtGTX2ThOqwa572FIpPF/RnY9py9JQh7UovxQHxno2oIcddo0LhnTsnubUrHbtF7kn+1k+q
	ZvuoF2Q+8qieHHnnK5v4LM+YYzdt8e3kSXWmw17J/DO3kEg8pIY6cHAHL8v9Mc4BloACDazzFCv
	mNGRwiWtLPUpUliSy4ICUYiEP0l1Tn18UkKAs4sofmzT10D/g6PzPWfyriPpdFSRqImufx5bYdt
	gH42Zz+Mzsu9+Xfg47wiMWG11sxA3lWSv3EUUMP06Qz1kZlCVx0rY2ywZMi2uTuQLUpRfLlhm89
	xEmvdgVbG2JsJt4vzC12kOAM6NLCxbUQEbEGICExkvwQUX2ElwnktPsgwG68XhVTwXkKTgDtX+D
	aOblZ5KOxlHQKMixvx3LdYfR7tizlFzwjoJONLnqh5bc1WE8qyxkBWze7Ii7SGO3KUgqhycUhRI
	e27DxGRSLMRqKxZpQBQhb/Gk3u0mGxZoLZMaj7fR2u+G6C1yq/M6XQR8UWVKZcdxisgwcVoeSnX
	PDymkqIQEi9ut7jpA9Xe8bqq0waPShWG/w0fXlIa
X-Received: by 2002:a05:6000:4b1b:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-48e6e503820mr24938548f8f.53.1793620207733;
        Mon, 02 Nov 2026 03:50:07 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm20885304f8f.52.2026.11.02.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:50:07 -0800 (PST)
Date: Mon, 2 Nov 2026 12:50:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev, Dan Williams <djbw@kernel.org>
Subject: Re: [RFC PATCH v1 06/11] PCI/TSM: Describe the PCI attestation
 control family
Message-ID: <auh3H5zQwkzx96kg@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-7-aneesh.kumar@kernel.org>
 <auShvL2m00S70H3d@FV6GYCPJ69>
 <yq5amrrua515.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5amrrua515.fsf@kernel.org>

Sat, Oct 31, 2026 at 05:05:26AM +0100, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Wed, Oct 28, 2026 at 04:26:13PM +0100, aneesh.kumar@kernel.org wrote:
>>
>>
>> [..]
>>
>>
>>>diff --git a/Documentation/ctlv/specs/ctlv-attestation-pci.yaml b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>>>new file mode 100644
>>>index 000000000000..edb35cede0c2
>>>--- /dev/null
>>>+++ b/Documentation/ctlv/specs/ctlv-attestation-pci.yaml
>>>@@ -0,0 +1,79 @@
>>>+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
>>>+%YAML 1.2
>>>+---
>>>+family:
>>>+  name: ctlv-attestation-pci
>>>+  inherits: ctlv-attestation
>>>+  pre-init: true
>>>+
>>>+attr-groups:
>>>+  - name: pci
>>>+    attrs:
>>>+      - name: name
>>>+        type: string
>>>+        min-length: 1
>>>+        max-length: 31
>>>+      - name: generation
>>>+        type: uint
>>>+        max: 4294967295
>>>+      - name: tsm-id
>>>+        type: uint
>>>+        max: 2147483647
>>>+      - name: connected
>>>+        type: uint
>>>+        max: 1
>>>+      - name: locked
>>>+        type: uint
>>>+        max: 1
>>>+      - name: accepted
>>>+        type: uint
>>>+        max: 1
>>>+      - name: dsm
>>>+        type: string
>>>+        min-length: 1
>>>+        max-length: 31
>>>+
>>>+      - name: object
>>>+        enum: evidence-blob-class
>>>+      - name: challenge
>>>+        type: binary
>>>+        min-length: 32
>>>+        max-length: 32
>>>+
>>>+attr-sets:
>>>+  - name: device-info
>>>+    attrs: pci.name
>>>+  - name: change-reply
>>>+    attrs: pci.generation
>>>+  - name: state-reply
>>>+    attrs:
>>>+      - pci.generation
>>>+      - pci.connected
>>>+      - pci.locked
>>>+      - pci.accepted
>>>+    optional-attrs:
>>>+      - pci.tsm-id
>>>+      - pci.dsm
>>>+
>>>+  - name: refresh-request
>>>+    attrs:
>>>+      - pci.generation
>>>+      - pci.object
>>>+    optional-attrs:
>>>+      - pci.challenge
>>>+
>>>+ops:
>>>+  - name: state-get
>>>+    type: action
>>>+    fd-access: read
>>>+    reply:
>>>+      attrs: state-reply
>>>+  - name: evidence-refresh
>>
>> I'm missing why exactly you need this op. Can't you do whatever is
>> needed in the provider evidence_get implementation? Why it needs to be 2
>> step.
>>
>> Also, why do you think this is provider-specific op?
>>
>>
>>
>>>+    type: action
>>>+    fd-access: read-write
>>>+    availability: dynamic
>>>+    optional: true
>>>+    request:
>>>+      attrs: refresh-request
>>>+    reply:
>>>+      attrs: change-reply
>>
>>
>> This differs from what I had in mind: a transport-neutral
>> ctlv-attestation-spdm family with SPDM_GET and SPDM_AUTHENTICATE.
>>
>> SPDM_GET would report discovery BaseHash, discovered slots and their
>> certificate digests, authentication state, and the effective
>> authentication slot. SPDM_AUTHENTICATE would take device-generation and
>> the selected slot. EVIDENCE_GET would retrieve CERT_CHAIN with
>> blob-instance=slot without selecting the authentication slot.
>>
>> That discovery view is not present in the posted schema; STATE_GET does
>> not provide it.
>>
>> Would this split work here? It would also allow non-PCI SPDM adapters to
>> share the contract. I understand that multi-slot discovery is deferred,
>> but a slot-zero implementation could still use this family and operation
>> layout.
>>
>
>The only point that remains unclear to me is the distinction between
>EVIDENCE_ACCEPT and SPDM_AUTHENTICATE. Also, would EVIDENCE_GET retrieve
>fresh evidence on every call? If so, we do not need evidence-refresh.

The distinction I had in mind is between authenticating the connection
and approving evidence before allowing device use.

SPDM_AUTHENTICATE would select the certificate slot, authenticate that
identity, and complete the required SPDM/session/IDE setup. It would not
authorize TDISP RUN. A preceding EVIDENCE_GET would be optional, for
example if userspace already knows which slot it wants.

EVIDENCE_ACCEPT would reference an exact EVIDENCE_GET result. After
userspace appraises it, acceptance would perform the native transition
allowing device use, such as moving a locked guest TDI into RUN.

Typically:

  Host:  connect -> discover/select slot -> SPDM_AUTHENTICATE
  Host: connect -> SPDM_GET -> [EVIDENCE_GET/appraise chains]
      -> select slot -> SPDM_AUTHENTICATE

  Guest: lock -> EVIDENCE_GET -> appraise -> EVIDENCE_ACCEPT -> RUN

This is an API design choice, not a protocol requirement. Using
EVIDENCE_ACCEPT for both is an alternative, but then generic acceptance
would also to carry the SPDM-specific identity selection. Better keep
that separate.

