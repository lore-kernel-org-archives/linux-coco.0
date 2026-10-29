Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266210;
	b=JnRj7AZYH3vxFi4MTL5YExKISI2cs8qUvEzth6BhvhMG8laVIehNRQMjxrrUAH8L6Y0e
	 3femYn1K0Dj1qnm+/W/ytD2tp5282Bs3DH3ulFKZnOeRakulX9buRvD8ok9FWNLAP9eJB
	 iE217XMGreIvCVbpmSqkxIT1tBBYYdTTXcd6tXroHOZMCMX982PJEU/BiqBulO0gWU7pc
	 afdmMiMJ5/yjWp3ymrA1oJkRZh7y3oQDWhzWgVY7Kl5sK0MwEWXcAyB82oa7ZpCBQDMFK
	 Y5hbnatpZPP2vo4/imUbhtXto1B9VYLjZfTJ4v/flKl0a4FhOqsJM32guChJvqtHWGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
	b=1pxuFV4qxze0UWOACgvCc7aO+GJPONseHEmmbYmA/Uc3QgADV187BSH/FNlzgasmjwZQ
	 GWyhKmZT+IY80qBeUzosdKpzKRVn4EJKfyDUbROABpQPqGdjUYOloojJRc6KiyA2ELW+c
	 x8h1J9nZE41nvB+Jk4d1zuzlQxXvfbR1dY+f02IynLm1Q5HVk6bDeRQFqX/A8/hyD81TX
	 asFDQfYz5r2bVZX8bYUJ3LBKZ+XbkdE6uxajvHM/gZnsEQ0Le3wl3Tq2NWeJIcfslDkK0
	 MMuhSFXTAA7o8euxnMULtUNYNT8ib745MZfBOtj0wYl2eXWB3QfqHZDZsmah/LgEkBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A3606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1667820f8f.3
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266207; x=1793871007; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=lkNESvJmzcP1+J2LHaoToOX5qRTGPfdgUzNJm/vnfbl6G5bKHMt1HuSrwORY/SWyu2
         +8AimyCP0IzGC+3pD50a927btzZUeJxGuaF/M3eQIyyQ1/+jRIDHzjCH2h8h/uJhO1DH
         d72iPEU4Ja1KYu8FKNbY7JxDjA1cxdosEY42a/OsmoHW6lpgg6/8s3nzZwp8PFQytwmJ
         djxXsbsAp9ALe4flvaMdvwk2e9CUSbiTTq23nd8AhCc13v20kB7+2M/UIg2uINM/5wmX
         htpVagLnkuo/zQbqeJbB+5J1Mb21D6Eh6F+NQiWmt/DoRGXEry88EwRpbB78LGk1u7o+
         HE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266207; x=1793871007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxasBSQqzrj10fgfbmH9pq+LqGH/ruAKc1rAsZ6gHrY=;
        b=Td5A2AUnqMjL9rjFp4V2cF5gSCcZuhK8jm5QuxCtxBGfztpfmaU/5qmtbUd4gYX5dW
         B2rIb/Hy5iefo8eMTdXS7AixbWUPPnyrlyGpQRJ3D9RuJSaEzRBn7331oOQny28W0xoF
         F6yYZx7nEUAL0WH86uQyrC9yTVat6Xw37+8o8wwwAyVgsY//wDktuH9zUDYRORhOsm3K
         XeZqA1GPBKjpinvOGtfJAZlVc8ZmOJ21cui3meH8N6jG3D4Fs4B/2aMMF1ec2seqlAkn
         EIhBBkjFvnrZGCClLOouRANbd5CpMZwGSDuExmGyXNV9o+oCl6Axa3kqwzrEPynBFAnN
         V+rA==
X-Forwarded-Encrypted: i=1; AKwUvBzyFalIKP3vCEpzRKojZMUFZQufzteYiuup6meMCD6dsdWy1ITKRWUH/Upn5fNABY9DCnodnandeUI/@lists.linux.dev
X-Gm-Message-State: AFq9FYLnIaonsHWtWA9D88nEyh7dRQgTdjeccwGlGxQUvIk3xCEJCmoX
	Q8sUdp0Gqk/XAqLYzb42lf3x9quc0F6Vtm7rLwbSdEeRomOq9SFqgJUgTjFKnJh32X4=
X-Gm-Gg: AYBFou3hFoziMpKK70XAhGnNbYd+y8XMEx+XnwIP72nk+ZrxGW1/ulzXEADUYH/sQb6
	nTKOjn+tF+PRNeNq+SUtDXQv2oDfoEmftFcXJnz1bvA2a0Uqn8/bSULrE1cm4tj83+N3ZGJKN46
	2txHBL9QF7uqyTpXPUy7ivkwr6gftHKF83UXHtkdb8JNLOXW0GcAH131fqOJlF+rGffYUEUxlpa
	wzrD2mShFk1yiD7G6PmM5n7qb2a/I4yxalHg4Vwmnq66mWK+PVuXTilVMZzBCsOk1E6M+E+k0am
	lKFUXa260osN2tQJLp/Dt/ax1xmVFifF2L3IOaEaHcCMvTC628a4N54Vveob7UjSPJx+ybnOzPd
	4vRlrRhnFIMVA7aaEQrO4Ef4f+wb2dosggJmZKJgnxKRjNoDRw+Z89BpcPHf2yhVA/v7W9Fxd62
	4aOcmuQyh0qpMDgRiOzO7phDuBN+ZCiasZ5LPca0folG7RNLW9Csn0oDXZpidoZAj3Q1bCYNluf
	3aJ7nK3VoFQdMjulzyYuLwDMjnCJdei9WFxX7AK/9x6IrEYQkmomp+YFxd9ZQT27xkyHH40ntIN
	gNte8aXMXzAdVe9v7GridSmuQRnjuSmMMKistA==
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a966c41007mr110102485e9.15.1793266206771;
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40285265f8f.44.2026.10.29.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:30:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:30:01 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMR_GztmsRcEHpv@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

Wed, Oct 28, 2026 at 12:09:19AM +0100, dave.jiang@intel.com wrote:
>
>
>On 10/27/26 12:36 PM, Jason Gunthorpe wrote:
>> On Tue, Oct 27, 2026 at 11:43:04AM -0700, Dave Jiang wrote:
>> 

[..]

>
>>  
>>> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>>>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>>>    directly, which gives 3. In a real TDX guest it fails with
>>>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> 
>> I would have naively guessed this should inherent from some SPDM family?
>
>The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>directly, so I think the test's 4 is what's stale. Jiri would know for sure.

Yeah, looks like the test is stale indeed.

>
>DJ
