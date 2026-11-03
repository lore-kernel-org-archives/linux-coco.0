Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695138;
	b=CDufiuR44DMa4fgaIMpfyF6KSolZBo6d5NUOJw/BAK6flVmRjw9AeFgp7hc0iEPFwl/5
	 A00TfABmY5p2zDl48ejtssWcH+7vLUSKbk+jkLWylkzK7OtzqvjHU8fiCX+8pucVAscBh
	 CxdTOYs9Qegg4wd6Ah5/tPfwBor/Zab4P7jtvjgwitASpcT/ZB3UUuvnMYB+7E4920/dJ
	 YaB1rwH17I+gAXYdLBNzO/rmJh7RLncRBkfNhChCDR4HVzjya+Rzc526NWgI+PJ5xRnRb
	 88D1+vhvELZ1pgd/aJKG/Fs9j2Wa9GgdbfCZn8Y7BDj1f++BLvAh0etvliVKEbNvZJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
	b=YTrgKxozz2/G8cBsr47kjcFNcJd2dAPIms6ZqorASiE39M9AFChe3gej+8ofcgXi8vrN
	 zWUzKtBPr3QWLL2HPAV4iWJrZWWT/ApYnaecI/fvt+mOtoMX4uh5hbNbhfLdFyxZzbLdu
	 oc+//Q6y44+A+rNDFapJx3VgTs1HSqAadsH0+wDko0KFRbT9QXEn4Sq1Czrr/ZlcZ5rTp
	 OwkM6M5Y12nreU1B0n8viFJ5awNjTkSVHnDRubwa1iVaJSDsZ0wtzlHSPOuXyf6uK5dvY
	 v40HB/8EPgwEEJuQUykYx/TPWlu27Q6x2G+xP2eZMSXHaYLHO1194hg5/xjmpj8U/Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=tFlppeye;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F887606B6E8
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 08:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F887606B6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=tFlppeye
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4000605e9.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793695135; x=1794299935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
        b=tFlppeyemWm1jvC7TFCL8L84rGhMZCLNwngVeDEXhPM8s5hwxkYH9/j2V19ZOnSCgG
         jM6XRFqXhK3IbgdSvvZBtRhTZixX2zGGW7UfxYLrt6LEKMSej7K3MunCVmdq2gRywSCr
         e11XmkUrpMf/tHP2kK1U+1c0wrKm+mGKr4y5EtpEiZUjWxIxowAv+YlCF7AdssKSEQM4
         hPgjqGG8e1uDtJDN9yqU/DLEE29EYs7JRTRqWad2kkMXLvxoalWstHherKrH0wKqx/6L
         KpxoOLjFYAJWj7FllTgTDyd087tfEeXztrtEg399usBnOzS9c9yasZ8GLaY0o/sQxd18
         FSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695135; x=1794299935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRTks+7ld7RMCsMZY4NHpGohDqoSKPsEVE5vKTy4ZGs=;
        b=O/x96sGz92CrBA1SPSiFoqVfDG63PCcAX2p69nmmptH7Tql/w8onCF0V2PJ1TZvhbp
         flZ4mBtREk6z742Fo742DfmUROJaN5ZxEEtYf4m3P43aYLlpEGTyIxB6Xv201QRDkEjX
         XILlmLx4DQ+lsEVegUpCkbEWTlWMmbw8SDaY0X8xluoPuRln+yMlLbMQ1afmxeLKYVQl
         0IpiwjaGsM/Q76DKYtQAdvdXiQlCEPxjUjfmBayset7VnwC3qeKgWbeNUYIvtUr+/l1p
         fMePhfFAjzIQN18SwbHw6TjVJUWCFUjq3txx12n57gd6GQPho3Pj0lXlOEQO0ptSRILW
         X3lg==
X-Forwarded-Encrypted: i=1; AKwUvBxyesg1Y85hSpUxheznMUeXM0VAuyJib2DbzzJxq6dFlqfhA1GS2cwPkH8OT5UNfE6ChWhKHSeStBsx@lists.linux.dev
X-Gm-Message-State: APuU4Z8LxIKd92CkEpc6g151+vbretY/KLvsMCWtdm5S0Wb31AZZTfA2
	J66DBetzDShRI4i6aCIOKik2RlZZP03bkkgVOMAOEprw9GUog2fHfhiLrcIX1pV75mk=
X-Gm-Gg: AYBFou3hpHmxz+JP8h1j9WoC3vQ7ekpTmAAkXSMRWpAnsEdS/yDVBXfnz0sjDC9/gYy
	u5zdGL1U+HUrtN+tWuikT+TQxc8RzBJjf9oBXULFVn3GNmTJhEysLcSPMaJJANnaVPsyDQrE/Jc
	EqgQ/gdPJoyZ297TX7H2DytoT3pI+wGn1q9hFsX+YDylpQyTT7dLlkhjdtQqb9FOTpUmc4JS+Lm
	e/6Dp9kwBHdW/2I+4IcqTnr8xKpgveTizZ2b64ddloSp5L4L6DZ9sJsqCwrOUOe4uM5NQq82tMe
	4cZAXOaBXVA4gLktenCLrJzDOC8lXRTuoi5RRiK6/Bctc5XlMjlqdaWc+Jcxi+VXNkpmf1ZX8mN
	zrfKGJFVs1eBdKlVzTHAkfucEQDuIpUiAglkGWAihy9P//QR78C5A6gDTNZ+6APhbjozCg7qAms
	t+UBYSUAeCP6s0f+T4U2MjK5NH3hnlEZwzAVvRK8ociXTKmZXlq99q5I04ZRpkuu2q9w2S3MWY6
	o1orVnWAxVY9HOKfrVmGvKB7UDUYicXValXX/B0XwdHBxyd071ul52Q5lpOYGMO5V7QMLGKbLXi
	1rLfmQmPtLKG4LvgeUbTmxFMPrx9gQwMKX9CE9Be9yDXwmE9BNIAspgOnyM=
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr285917965e9.16.1793695135152;
        Tue, 03 Nov 2026 00:38:55 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm432002285e9.1.2026.11.03.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:38:54 -0800 (PST)
Date: Tue, 3 Nov 2026 09:38:50 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <aumdeBFHvrN5_NgX@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
 <yq5av76sj10a.fsf@kernel.org>
 <20261023142038.GE3977851@ziepe.ca>
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
In-Reply-To: <20261023142038.GE3977851@ziepe.ca>

Fri, Oct 23, 2026 at 04:20:38PM +0200, jgg@ziepe.ca wrote:
>On Fri, Oct 23, 2026 at 01:34:53PM +0530, Aneesh Kumar K.V wrote:

[..]

>> 
>> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 device-get                                                               
>> # device-get, 1 fragment, generation 0                                                                                      
>>   device.generation 0            
>>   device.caps                                                                                                               
>>     cap.evidence                                                                                                            
>>       cap.min-challenge-length 0                                                                                            
>>       cap.max-challenge-length 0                                                                                            
>>       cap.max-total-output-length 369098752                                                                                 
>>       cap.evidence-flags evidence-accept
>>       cap.object                                                                                                            
>>         cap.blob-class cert-chain                                                                                           
>>         cap.blob-instance 0                                                                                                 
>>         cap.format spdm-cert-chain
>>         cap.representation raw                                                                                              
>>         cap.representation tcb-digest                                                                                       
>>         cap.hash-algo 4                                                                                                     
>>         cap.hash-algo 5          
>>         cap.hash-algo 6                                                                                                     
>>         cap.max-length 16777216                                                                                             
>>   device.info                                                                                                               
>>     pci.name 0000:02:00.0                       
>> 
>> I think we can use evidence-refresh to select the blob-instance for the
>> desired slot once the CCA specification supports that.
>
>Jiri these ctlv outputs are really neat, it would be nice to include
>some of them in the commit messages so people can get a sense of how
>this looks without running it?

Okay.

[..]
