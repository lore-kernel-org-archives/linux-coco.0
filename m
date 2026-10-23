Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765242;
	b=YaUfrNROCF+FgfbEGdd2P2KR8wQB6RnSkSFn+arZYsCtyfqwEeOfRXn7Glomcy0FI+f2
	 h+fnFNVZ50YT1qTlFy4Eyc+R6mHSdvxmaDTxrFaE7iI5NF5HtyLTz9/VzfDh/9o1xH5QM
	 uhLcrQt687yde9shy37TNmf/lOC0qqgJ0KSQvhMjr1xOgbA8qF0Amb1qGNdjMUyV3oPq+
	 LDQwBfboU77v7o5iGpXFHylTkxAFYkdmaR+m0dCmnvER0R2ZvkDGyeuAfiRsmWOKkq3mc
	 dhDEA3iBFBP07nqw5VscW/RZAvMzn9LiDMEPnbjw1uNXm3IBlrU9cpYGurETU5rDw4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/6hrkJLl8+7F6s+nQ7oM4f8Xx3u++n7ObY70TM6xwZM=;
	b=gSZ/LOnPynnRRK3XdqDA+cvdERNTqiennm5VEv2C2cyVvAKwRcCYiPd7wYTmepGUKj5E
	 MfTMcghMK0gcpjkn65e7jnHHQBtoKXRYeNWyBSP4vcHMZPCgnusCWtX4AUkh07hfzTlLP
	 l2Ux7IgdNAtcUjS4kuluyUvyamSdcVI6RdUwNSBl3glm8dcuksOBmuUvZFflCvXXnqwAt
	 9SqoH4OAEqrddjxrISOeyB+Hxs2vJMXOWjJzi5JzUv5TBBVdJWGPq7JINPSI2KSCQeNid
	 JLHzyL/rYNUY471F1m17adGo64mqsTpAvOsD5NPevereU08FZxO+C9fxj+u8zCZULVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="KElZ7/Pv";
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C2606A320
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 14:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5C2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KElZ7/Pv
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5366ae57896so9140301cf.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765241; x=1793370041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6hrkJLl8+7F6s+nQ7oM4f8Xx3u++n7ObY70TM6xwZM=;
        b=KElZ7/PvAQvLGK+cYLJQJ60z1E3BfIbWXQhJR8daDSaf47AAKrNQKNmai03TbdqASV
         rmDAtNR2IG9QZHGSaSlNoMK98xYjDQ5q6v6T9ziKjmZKJksDNfRaSRfqiEtuy/dljI9C
         3sjBonWnFKwG288osQ0qMrzc1Uvs+PSTUPGt6hMjg3e++1GWpjiVHZgGQMFbgx5B5CvY
         NX35LBQstiUUN0adC2biy/oMw5Kf9dgCaz6HNfwM9nDkN1Wy+GTqbqKq+9mSdv3Yy+uq
         AkwaRJT1+R5ixfaJqPrWxNcXdHWVL8BxdUB25nM+L+OLV1FWIl0yZaVz4q5oqNL8+KaK
         RFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765241; x=1793370041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6hrkJLl8+7F6s+nQ7oM4f8Xx3u++n7ObY70TM6xwZM=;
        b=wWP6qAwXUdSZx9BSnXUaOMehyCdwNB1S2p5w68+NiNVtF41wRWhw/lSlwMw/a03LJ2
         rcWhRLea2NFWy2ChhDuZLJN1bl38tCTwoVESMBpyS+hMFgvoXr8N4Y0XJsWNXzhnctOn
         afXk5Yx+yUdAgc/oDFKRjhLo24U0Q1f46iOuuSAKdBsca3APMmlvLKe01bhTTcEspQrt
         1xGtUpluVLASWEhwl8hp3fvCslVjZDTBaHLEUStEPZVNTmxuQTNSyYRz2xojs4ovOz/d
         gvjmzevsjYD8uQQ8gbuBwFpRzFHFxYljgMYwoyDgZW0Yo019htVxTIEiNZnyUIIppcI9
         ks0w==
X-Forwarded-Encrypted: i=1; AKwUvBySTtLTdHcSL3dYQJ+NEey6u98p3CWdCt3aDngFDqTmuIHxF4HuVXvr4V/YVZlDs5gH2c+KskVaCW2i@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6Xb+GQj8/mKGEnK5xUxS56w7HWT2Eaj2mUGSoZ3UhojW8NiuL
	KseVOGDbSUfRAdlQ7UZSaSTkjrao9AIaIoR9hThxP3WoONysvu49oN9OWd8UE6lXygJJzpYHFlt
	AXiCu
X-Gm-Gg: AYBFou1ajmT378JTlV1uD1MLxFlsx+q+LxW7Dw9DMqhMgffPgXHHO02Na0N3lYYR57l
	GALaPqbApjs05wrqFl3Ck8xfR//Q5xAXSVKGVpL2QbbSOiQkJt6Y4yxuPrxw3u1QhVx/pUiLso0
	CIIYP2iamqxD+Qz4N/IhmhMzBHD+SCldnGEgOD5kl0iCGk8oyr1KUiqO2Yj1I3tqzw19Z4QddAk
	UsBYC9gD4MMEvNGjiQFbbcHBc/UPzM0eeAUGsXspwVK2Ww3aQ6TLWyLsK1raQvo8GItP0fXRKJy
	DYMDMDqKvLWhA3LdTOjXe3LHS7ZOzIOcn+CXP3OzTNtJ0NkqQzNKWEk772OU5fVzhBoWGUvSreR
	isM8WXfr/rid9TiZcUjgqXovF5Vf8s+hRgR3lJrkE+VNdOEex/Pz5DIvO9BiCowCNgijsCZBnjy
	qdiXoR0ATRdCIJv0C/mvX7m/zBDgmSbUJ7DXN1u8q9O0sGNsfZG/6OfmaQtrl77E8BQZkjuOatY
	s6WiytHVWqT34K4pZrvx25Yq6I2IOBzKnxKF4tchyWASkhuWYBvbwv96E9Mo08Lq3gyVJBBpxNO
	2oIjRriRvyzE2VZUlEkZWKGf3v9JrMDDiOt9nA==
X-Received: by 2002:a05:622a:1246:b0:533:32f3:1db9 with SMTP id d75a77b69052e-536c2696164mr33421181cf.11.1792765240843;
        Fri, 23 Oct 2026 07:20:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c1872a8fsm17665301cf.23.2026.10.23.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:20:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKG8M-0000000Gj4Z-31qZ;
	Fri, 23 Oct 2026 11:20:38 -0300
Date: Fri, 23 Oct 2026 11:20:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261023142038.GE3977851@ziepe.ca>
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

On Fri, Oct 23, 2026 at 01:34:53PM +0530, Aneesh Kumar K.V wrote:

> CCA currently takes the device identity index during pdev_create. I am
> investigating how to retrieve the certificate chains for all slots. For
> now, I have implemented the sequence below.

Yeah, I think the consensus at LPC was this may be a gap in CCA.

For now I can imainge CCA just doesn't let you query the certificates,
and we'd need an ECN to correct it someday once all the kernel parts
are settled.

I broadly hope we can use the software SPDM implementation to really
flesh out the uapi and make sure that everyone is happy with it. Then
we get what subset we get from the first generation of products.

Something like if userspace can't get the slot information early it
just hardwires slot 0 and goes forward.

> echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/connect
> 
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 device-get                                                               
> # device-get, 1 fragment, generation 0                                                                                      
>   device.generation 0            
>   device.caps                                                                                                               
>     cap.evidence                                                                                                            
>       cap.min-challenge-length 0                                                                                            
>       cap.max-challenge-length 0                                                                                            
>       cap.max-total-output-length 369098752                                                                                 
>       cap.evidence-flags evidence-accept
>       cap.object                                                                                                            
>         cap.blob-class cert-chain                                                                                           
>         cap.blob-instance 0                                                                                                 
>         cap.format spdm-cert-chain
>         cap.representation raw                                                                                              
>         cap.representation tcb-digest                                                                                       
>         cap.hash-algo 4                                                                                                     
>         cap.hash-algo 5          
>         cap.hash-algo 6                                                                                                     
>         cap.max-length 16777216                                                                                             
>   device.info                                                                                                               
>     pci.name 0000:02:00.0                       
> 
> I think we can use evidence-refresh to select the blob-instance for the
> desired slot once the CCA specification supports that.

Jiri these ctlv outputs are really neat, it would be nice to include
some of them in the commit messages so people can get a sense of how
this looks without running it?

>  ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get                                                                
> # state-get, 1 fragment, generation 0
>   pci.generation 0                                                                                                          
>   pci.connected 1                                                                                                           
>   pci.locked 0                                                                                                              
>   pci.accepted 0                 
>   pci.tsm-id 0                                                                                                              
>   pci.dsm 0000:02:00.0                                                                                                      
> 
> device is marked connected, but IDE is not setup as indicated by pci.accepted = 0
 
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-get --json '{
> "evidence.challenge": "hex:", "evidence.object": [{
> "evidence.blob-class": "cert-chain", "evidence.format":
> "spdm-cert-chain", "evidence.blob-instance": 0,
> "evidence.representation": "raw", "evidence.data": { "file":
> "/tmp/cert0.bin", "data-buf-size": 16777216 } }] }'
> # evidence-get, 1 fragment, generation 0                                                                                    
>   device.generation 0                                                                                                       
>   evidence.generation 1                                                                                                     
>   evidence.object-length 1632           
> 
> 
> I added the file: attribute to verify the evidence blob's contents. ie,
> we can do:
> 
> # file cert0.bin  
> cert0.bin: Certificate, Version=3
> 
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-accept device.generation=0 evidence.generation=1
> # acknowledged
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get
> # state-get, 1 fragment, generation 0
>   pci.generation 0
>   pci.connected 1
>   pci.locked 0
>   pci.accepted 1
>   pci.tsm-id 0
>   pci.dsm 0000:02:00.0

I believe this broadly matches what was discussed at LPC.

I really like that we can break down the steps from SPDM setup so we
can get more information to userspace to have better logging if things
go weird.

Seeing this makes me much more comfortable that CTLV is really adding
value here, these data formats are pretty complex in the end..

Thanks,
Jason
