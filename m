Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755184;
	b=yfcGgsH6KhE2aPq7LlEtls2+opYGm60G8fmY+jx8Uypp6SY9DNlSx0ZO8oxskrsPXgy8
	 82FU9lmuZ2bWUZlJ7cZ8BHgLOGryYEYl+KRMg1RoKuEv6dTWfyJmJHzDNTbcPhCBALmuN
	 2Unc7cjc7cyOJKaM2wucVxh/k7DgjE00QiHDXgsAEsRdvzdvVYYo9yUJC1/oiB6Mmxo/k
	 IB7fl4TG+GFpMW87qXhqtQ8Z4lf73VKqHjAagvn0A3KVtFgeVjMGrGK5k0lkm3onrk7gj
	 qoG98LMYYWPhvrzwe67fxf6q/lP33al8CPb5eBmT/F5VCfXLi/IAv4MAZYrejQthreA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
	b=442pdzWWQPoElmMTaRO41uYguNMG1Mqan7Z00iVXEW3m+vWqYHXGn45UJkynFzadi8d/
	 2C4CeyGU/9IbLpwFLHQ3yWZRads7QHn5TVLx3xG6aHsRbZDOmje24trEhCVlgc1CdFe6r
	 9+7BGYTzTZN5FXeLnrRxsGq1CGwzjDP3IZb5FPaaTtbJDsGu7C5UMO71D2WCGDuKUq5T8
	 xTbPJ/YkHP/vCeRdZeeVCkKSv8em61Y1sAjTXQ4GbBgvLABJSkZY0+p8UxYysal3xQ11X
	 760UTkxLzNuG8Uvug/k895SgHn0PFE3rSuYR5mXYUuVcftPTzpByfuHG9995tIRDOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iD0EUA6J;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B4606A31A
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 11:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=iD0EUA6J
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso891988e87.0
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 04:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792755181; x=1793359981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
        b=iD0EUA6J0EpUvKXAy6Wo6fU9sbjXbk4gVPjai7nYLPRgyfY/KFe0t3JQAEOq4KYgqE
         FOKe8ynd27Wa4ptgc0/Hl9o1U72PaIfqSZhK+7uuHrZFWdWSETgMwUoQo1ovZfY9GoMu
         xq9jDiVzitFO4FNHZtsgGudj8rH/UiYD8Hl47aXG15wLP4Ptvg+YjDJPLdnmUO9K5peL
         fzdbuIbrhRqiyf4Arm2rq4tIS2MkO68RezSJlGdIRIwnH64UwiRcMc38Xl9pMBFg5xbg
         5O0rEmYKdOHC+59vOo6jQF4nRxokCu04g2m8cVGBnBwvZ6QoYjq3ouo7frBEbGA12nSD
         1zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755181; x=1793359981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
        b=2B32Yk3+U4y9SiIwPBL9C6cGh5uxmVX1XJP4vqry+jNTQQpXhDpV8ykEidcYq27sUk
         H1wYGvTPv4O+XpkT82K81bCVrSR0CPA2JsANSf/8PGkDRnAvfBRiDqCeBR7JTG4+0DM6
         U2XpLJJ9+vXoEzsv7lNsgtCwl6pb8KwLMwMNnazFojtIicGOhHqyRGNZYmkn1I0n8ftZ
         925+pTI0lG6plT0B+hP6cn0sv4UHBsjSrybGouBRssTTBAf3mwFvu7cLIjs4YgAHmEhY
         fevj0JxtrgH/aaBzUYGkJP52GGRNdWDtbfFOgrdhy1a+NZtcsH+QfhWgCetIj+OuiPG3
         4N3A==
X-Gm-Message-State: AFq9FYIbIfgFeTFPPGILTCdSQNeFOG0VfcLDOmmxKxEBD+gBHCE27UUp
	Fk0d8VkYah5dm0o498+fZeCySkqLpFwgOWUqYBBxwnoIdDbf/t4H8tW2gwdW7kKNwWI=
X-Gm-Gg: AYBFou1o5wUfI3LcRV7et89OMMdA0HRt4hlR31MlTu6VMCVnDTbNw3zQ0xD6L1qKVcM
	wjus6O9Ysy3nqYR/sJOajmbh6IQwux6p/ww6+CD74WVv7QLWUyO2bq8ZwHtDPEqfagNH/oAHaLJ
	KrymfuFA+yEhBIkwQmGgHSZFhh+LmF7LwnR52iIRMbdnjw+di8hpFZHW1YV7P+M+WLuhvhLlvQ2
	MONDz+d2DUO3ElZ1rw2yW8XFfgmJbXpooxCqy4CjAUHjCFRk5Id1XZNXLGUJuB8xrCwWqOmK7u4
	mMaEpg809pec7QCN2eYkcxBSw1n07DnDycMN4slRYZ0t5VKS6TmBGLzO1Ei8rOlgg9f0INU2UOF
	donHk1tFv453V8k59Y2xXsoCwdJ20K/zA9jng05FUlh6FOnIx56CvXSQseC4Rx9R5iG775qDD6W
	/DPt02d9Igs0gGDVQ/OVEVM4bA7/v8Jtbs2Y28Za1km8sfgJgPd1rYYcjUytNr5bGtWuweI/A09
	YVP1t1IWEdFIm2dBKZOv0nCBGOlODOHBJI16jK0WLrYQ40qaZUtGQMmFxibjxe0W1M=
X-Received: by 2002:a05:6512:3b94:b0:5bf:aee8:7b4f with SMTP id 2adb3069b0e04-5bfb0b35f08mr746484e87.27.1792755180559;
        Fri, 23 Oct 2026 04:33:00 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02732f4sm349248e87.27.2026.10.23.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:32:58 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:32:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atspV8U9HCw68My9@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
 <yq5av76sj10a.fsf@kernel.org>
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
In-Reply-To: <yq5av76sj10a.fsf@kernel.org>

Fri, Oct 23, 2026 at 10:04:53AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Thu, Oct 22, 2026 at 12:30:47PM +0200, aneesh.kumar@kernel.org wrote:
>>>Jiri Pirko <jiri@resnulli.us> writes:
>>>
>>>> From: Jiri Pirko <jiri@nvidia.com>
>>>>
>
> [ ... 67 lines skipped ... ] 
>
>>>>
>>>
>>>I am using this to understand what the IDE setup flow would look like,
>>>but it is unclear whether the connect flow belongs in an attestation
>>>framework. I understand the desire to pass the certificate slot number
>>>as part of connect, and sysfs is probably not a suitable interface for
>>>that. However, is CTLV the interface we want to use for connect?
>>
>> I was thinking about this and "connect" really does not belong in the
>> attestation CTLV (same applies to "lock"). I was thinking about some
>> parallel PCITSM CTLV instance, but that does not really click as well.
>>
>> Currently I'm thinking we can maintain existing "connect" in sysfs and
>> extend it with "lock" sysfs knob for Realm side. Both would create
>> ctlv-attestation-spdm instance. The same spdm instance may be created
>> for other non-PCI-backed device.
>>
>> The proposed host flow is:
>>
>>     sysfs connect: select tsmN and prepare the connection
>>         -> negotiate SPDM and discover certificates
>>         -> register ctlv-attestation-spdm instance in DISCOVERED state
>>
>>     SPDM_GET
>>         -> populated certificate slots and digests
>>
>>     EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
>>         -> retrieve candidate certificate chain for appraisal
>>
>>     SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
>>         -> authenticate the selected chain
>>         -> complete backend-required session and IDE setup
>>
>>     sysfs disconnect
>>         -> remove the attestation instance
>>         -> destroy the native connection
>>
>> The slot is therefore selected after discovery, rather than supplied to
>> connect. The attestation instance represents the prepared connection; it
>> does not exist beforehand as a controller for a disconnected PCI function.
>>
>
>CCA currently takes the device identity index during pdev_create. I am
>investigating how to retrieve the certificate chains for all slots. For

Yes, that is the ordering issue. My current proposal is to perform
preliminary SPDM discovery in Linux before PDEV_CREATE:

sysfs connect
    -> preliminary SPDM negotiation and discovery
SPDM_GET
    -> report populated slots discovered using GET_DIGESTS
EVIDENCE_GET for each populated slot
    -> return its certificate chain obtained using GET_CERTIFICATE
userspace selects and approves a slot
SPDM_AUTHENTICATE(device-generation, slot)
    -> PDEV_CREATE(id_index = slot)
    -> RMM performs its own negotiation and retrieves the selected chain
    -> compare that chain with the selected discovery result
    -> SET_PUBKEY and complete SPDM authentication and IDE setup

Makes sense?


>now, I have implemented the sequence below.
>
>echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/connect
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 device-get                                                               
># device-get, 1 fragment, generation 0                                                                                      
>  device.generation 0            
>  device.caps                                                                                                               
>    cap.evidence                                                                                                            
>      cap.min-challenge-length 0                                                                                            
>      cap.max-challenge-length 0                                                                                            
>      cap.max-total-output-length 369098752                                                                                 
>      cap.evidence-flags evidence-accept
>      cap.object                                                                                                            
>        cap.blob-class cert-chain                                                                                           
>        cap.blob-instance 0                                                                                                 
>        cap.format spdm-cert-chain
>        cap.representation raw                                                                                              
>        cap.representation tcb-digest                                                                                       
>        cap.hash-algo 4                                                                                                     
>        cap.hash-algo 5          
>        cap.hash-algo 6                                                                                                     
>        cap.max-length 16777216                                                                                             
>  device.info                                                                                                               
>    pci.name 0000:02:00.0                       
>
>I think we can use evidence-refresh to select the blob-instance for the
>desired slot once the CCA specification supports that.
>
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get                                                                
># state-get, 1 fragment, generation 0
>  pci.generation 0                                                                                                          
>  pci.connected 1                                                                                                           
>  pci.locked 0                                                                                                              
>  pci.accepted 0                 
>  pci.tsm-id 0                                                                                                              
>  pci.dsm 0000:02:00.0                                                                                                      
>
>device is marked connected, but IDE is not setup as indicated by pci.accepted = 0
>
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-get --json '{
>"evidence.challenge": "hex:", "evidence.object": [{
>"evidence.blob-class": "cert-chain", "evidence.format":
>"spdm-cert-chain", "evidence.blob-instance": 0,
>"evidence.representation": "raw", "evidence.data": { "file":
>"/tmp/cert0.bin", "data-buf-size": 16777216 } }] }'
># evidence-get, 1 fragment, generation 0                                                                                    
>  device.generation 0                                                                                                       
>  evidence.generation 1                                                                                                     
>  evidence.object-length 1632           
>
>
>I added the file: attribute to verify the evidence blob's contents. ie,
>we can do:
>
># file cert0.bin  
>cert0.bin: Certificate, Version=3
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-accept device.generation=0 evidence.generation=1
># acknowledged
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get
># state-get, 1 fragment, generation 0
>  pci.generation 0
>  pci.connected 1
>  pci.locked 0
>  pci.accepted 1
>  pci.tsm-id 0
>  pci.dsm 0000:02:00.0
>
>
>I am wondering why we need 'devsec-run' ops. Isn't that already the result of
>'evidence-accept'?

I split it into two steps to record the decision first and then trigger
RUN. But you are right: unless someone has a use case for keeping them
separate, the split is not really needed and we can combine them.

