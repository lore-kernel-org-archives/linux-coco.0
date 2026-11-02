Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623527;
	b=vg0HkC3QLBE9Ro8L7j6tsAfXrXlAMHxry9NlYbCxTSv/ZAro9OzCOtyEr5sL/0tx8e1U
	 4SbcmwDj3RY96clsT3Ijf3v8S0wNwMCDGuVT4atncCV8rn6N0GP2ILHxtNhLoU8y9D4Su
	 h3dFMolZX7cfhmSB74cjGp88X0VrnfXG8lCjVmbh2G9eXjHlRaz6QK/nNVtXE0C95zE2A
	 3B8wUW+KSO9LT/6GskD/Nx3EOZOJI+xjrxTq/Q52PICaomuRrtv7vEDP5WM8OBFd/6cib
	 8r7E96L/x5dz1MD7UNkPEEQyfloQs4426SrAVmJ9pNG1bdVCfOFarroz89ACGWPkLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PT7CWHpvNKeQzTrBYKakMU7LWZDvbAJYzwpyQwagUfU=;
	b=avWyzEXkKOju8tkVT8udz1qvk/NKyry4+Vrq0MLCVW1RZ952da70bsoOKALzUZhCBSDz
	 J/HyVBEEv6dE9GBX/C974k5kwgrwo5opc/W857gHSLwwMp0cRVXKeynT7ClnVmLifNYKn
	 5YXvjU8CTWMfQh8yt3QMvdMluj4UtgvfRHEqMS1PG6vvdzYb3UHmDhXUeX3udINO9qgQS
	 4qls62WAepxtHVLwbEDcC6bL9rkfgK6J1u73zQLhRiNkfrlSdacGQb+mjLXbZt85ayzo+
	 WcZlE7j3Qm+cs+WkFCpqjOedcF0EY86F+eLELWEKBBzVOmpimFt6LrNN4IfmycpfnPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dN6fVMrA;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977E9606A33C
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 12:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977E9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=dN6fVMrA
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so11458001fa.3
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 04:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793623523; x=1794228323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PT7CWHpvNKeQzTrBYKakMU7LWZDvbAJYzwpyQwagUfU=;
        b=dN6fVMrADnnOq9gAZ8X0cwHOCy/Yxe6sjLHs9Pi7OzMOBLrOBTFlyo/4WwDrKcaEF+
         EMeBfgKn2wA3qQNU4cO8OYTsWSF00QV3ZsnzE4oBry75vJWJLPhAw6RQyanHE18ljhci
         TmENhoiVZuTBXQU6+e4GzYZe8v3CZtIHrmr4nZJ3DMLqIMz4nW8qEreEZMWpXiR2KdOp
         vjtIezSW6pCjSb7TIDPSO+R+Tyz7IYbr7o6jO6B/9Uwu5ubAWXdIqKTDh6lyVVhGQBvL
         //lMH5YpavS5vO1aEPId8My7BcXsj0QfI0E6QeZbhKnQTrBcw2ktdKx0ilxsxNUGP7CC
         HMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623523; x=1794228323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PT7CWHpvNKeQzTrBYKakMU7LWZDvbAJYzwpyQwagUfU=;
        b=cD6KfX6MYZsUmNdL0vGM0CbbCHIug17vWwgsq58ISNVgO/RryqGoUbMwyPihDi+B3W
         zstn2du2988j+lygbn70CkQ4OSSl8WiMuFN4toSWRBfGK+f2cxUIXzMitaGdsFYVwq2l
         O+p4mg3OflEYGPnye11eJAU+jVn1MgDQpOnmxI+/io0xec9+GaHJkZjjkvSEra+OMtiE
         ll4HP6HzJEtfz9RLd8EOI9XrB7dQTU/hPmBRjq7AYTpT3uKWb7IzRpcvVWt6Ei9h1SvH
         3gaHWkBkAbfnh62JaWsLvOnW+jrT+/cIZZvKsTQ+0ZIv2qLXiuM4BC7Raf1mJKjMHW2Y
         ww5A==
X-Forwarded-Encrypted: i=1; AKwUvBziz7OpTuggqKEw+epAfcU2ry/5t4r3n1WWE37trvzw7WYsAoFqMgDZLri6AIV1/EwoSwSsHWngC6nc@lists.linux.dev
X-Gm-Message-State: APuU4Z/Eqc7Xu55qNPDW74SRQpf81vdoFBcPwkBO521vqsgc90R87+cv
	WwWFLqg6MDPAn95soUPX/mPxTqs3R6dl3IYA6w8AT9L1ETPOZV8htZ3UvnJy72VBu2w=
X-Gm-Gg: AYBFou1lxObbwq1ca1O1i9cuc2ZIvZ0nLzil7pj1DHF9A1egL4U3Cvp4rezzHBpx0rd
	oomLnvcvJj012tg442PRdOmYC9NosMg1EiMvofGUcEk9BUpF+gRAhHLNMifbsJn/VA7kb7qJnV+
	wnPiJ050JlkZgeYewRQpNvKquHxi8eZrY8FCjfu+NOcAivpMYp74gNaojI8iY0dg+byUhOS+JGC
	KQy4imaEYmMnvdFte37NQrdW0fP0VoPnlBRwIi4Eeost3KdNvxCr+eNgwEbg+1E1IMM/wEqnjpe
	nd/Uzkxrj8mDQt/9hrSpj50r5PkmlE0UvKRNRcp2I1/DP8CzFwo4RqtgCJIv3U7mYAs1I8XoR8g
	HsKqTMRnVC4VE7YfngY56nHSxwFaJSSS9IuIW3li7QnfSXygvKXRSzJf/ACXGxnsVK7A3wjFxtq
	CpiL0flQOlKw//QE5TLniKVWTKdoPlOWcBeUEtDNFyk7NhLNkK9EFPHA0ZMYTUqbOoo6oLYuJW8
	19i6ykaZZWEX5lQVvFMmgcCy9QQOEkvGgPxND+iv7c6mVh7AHqbrkVtpV5lEli7tbrpQps+d+Ag
	8WLC/MHyDE7R/rH+3IPcULHmEiIEuHkNmbJAD94=
X-Received: by 2002:a2e:9fc6:0:b0:3aa:ee9b:cf2c with SMTP id 38308e7fff4ca-3acb7aa8400mr22439851fa.14.1793623523562;
        Mon, 02 Nov 2026 04:45:23 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf458c6sm20091341fa.40.2026.11.02.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:45:23 -0800 (PST)
Date: Mon, 2 Nov 2026 13:45:19 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, 
	linux-coco@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev, Dan Williams <djbw@kernel.org>
Subject: Re: [RFC PATCH v1 06/11] PCI/TSM: Describe the PCI attestation
 control family
Message-ID: <auh_GGpJ0ngQTETS@FV6GYCPJ69>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-7-aneesh.kumar@kernel.org>
 <auShvL2m00S70H3d@FV6GYCPJ69>
 <20261030154353.GN3734323@nvidia.com>
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
In-Reply-To: <20261030154353.GN3734323@nvidia.com>

Fri, Oct 30, 2026 at 04:43:53PM +0100, jgg@nvidia.com wrote:
>On Fri, Oct 30, 2026 at 03:01:29PM +0100, Jiri Pirko wrote:
>> Wed, Oct 28, 2026 at 04:26:13PM +0100, aneesh.kumar@kernel.org wrote:
>> >+    type: action
>> >+    fd-access: read-write
>> >+    availability: dynamic
>> >+    optional: true
>> >+    request:
>> >+      attrs: refresh-request
>> >+    reply:
>> >+      attrs: change-reply
>> 
>> This differs from what I had in mind: a transport-neutral
>> ctlv-attestation-spdm family with SPDM_GET and SPDM_AUTHENTICATE.
>
>Yes, we should try very hard to keep all the SPDM stuff as transport
>neutral as possible.
>
>> SPDM_GET would report discovery BaseHash, discovered slots and their
>> certificate digests, authentication state, and the effective
>> authentication slot. SPDM_AUTHENTICATE would take device-generation and
>> the selected slot. EVIDENCE_GET would retrieve CERT_CHAIN with
>> blob-instance=slot without selecting the authentication slot.
>
>Do you have a mapping to ARM RMM operations already you can share with
>Aneesh?

Yes. For SPDM-capable PCIe endpoints, this is the mapping I figured out
with LLM, using the existing RMM 2.0-bet3 interface:

sysfs connect (PCI/TSM and kernel SPDM requester):
  Perform preliminary negotiation and GET_DIGESTS/GET_CERTIFICATE.
  Retain the discovery snapshot and destroy the temporary requester.
  Do not create the endpoint PDEV yet.

SPDM_GET (attestation provider):
  Return the retained discovery information and connection state.
  There is no corresponding RMI discovery command.

EVIDENCE_GET(CERT_CHAIN, blob-instance=N):
  Return the retained DER certificate chain for slot N.

SPDM_AUTHENTICATE(device-generation, slot):
  Validate the generation and selected slot.
  RMI_PDEV_CREATE(id_index=slot)
  RMI_PDEV_COMMUNICATE until PDEV_NEEDS_KEY
    -> RMM performs fresh negotiation and retrieves the selected chain
    -> CCA host driver relays requests over DOE and caches the chain
  Compare its DER certificates with the selected discovery identity.
    -> reject a mismatch before supplying the key
  Extract the leaf key; RMI_PDEV_SET_PUBKEY -> PDEV_HAS_KEY
  RMI_PDEV_COMMUNICATE until PDEV_READY

  Prepare the root-port PDEV to READY and configure PCI IDE resources.
  RMI_PDEV_STREAM_CONNECT
  RMI_PDEV_COMMUNICATE on both PDEVs, honoring STREAM_WAIT
  RMI_PDEV_STREAM_COMPLETE
  Enable the endpoint IDE stream.
  Only then publish authenticated state and the new device-generation.

[..]
