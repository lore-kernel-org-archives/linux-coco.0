Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353215;
	b=CGIE9e4t66iyXH2m7aDyGTaHl4Vf1r8NxZhQGncUvMZpOuIIotIoYkNPSVgDxzAwcPbE
	 2XH+5aficDxUk+/6qDysBxCSSZzGWamkxCtQgG1PmkAjRObP+U/bjl5ilAmFWaimlyPP6
	 uvk6kBiDNRPeUkDCfE/ZOR2F67RyNonLgV+AfoyAaRnjKrPyTTaERwFD9E3qhNNEGJ/p+
	 7pBHBEbCqNTWz3B4aNfsxiKVvIqR1NIEXxAF1zzen4yzFGce72YcTh09vBfxXc3f4amQt
	 /FTPoLYC+1j5DQRn1QS9baE8MsrcpYqT3iuu0gkT0ftlCiVEMXDRWOuweEt/YUht55A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
	b=u/2YSHU2zZHjkQCyDzSM3HBMwd7T7EhKH1WKy+G0QNxXiz/yJdy7Chm88z0UhjVzin5r
	 D3DEdJ8/NCd1Ne+XqNiCblClY3LkFzxpliPyWfRlEfY2A4CNv3XP7caZ7dlLaQjHQwTdc
	 MxnuiDrUGMYG61LWn8jrMhAhW0O9h/pDG9TvSDRE9/6wRXi4ld8Sf19LvIKDob1e+Jdqb
	 RNaovVpaNv3gWmlzAbb4CozewBqJEj4gGDmUvktZjPIM/hH2oa562n1014QCHeV0/KjVi
	 F/nwEKzKMzewgBJsn+3nRyWSa510Dux6pr98sLNFjn7+k5brg3i0ulrbc0T74xRW9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1357606A324
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1357606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso455076e87.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793353213; x=1793958013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=MB3nq/ZN7VmeL+tDwkbUiNOeju4Ke6wJqwVdI4FkybFFoy8bShdAI5103CFeqfojEW
         L/ipkC1DHPsq9bkhIVqwi+gze8ILchEE8h9/TqQ7nbnY8tbDFoRL95zvEv1AqbSOTJNY
         d5ewh3tCRB4RWYUx2KhZQiWPqKLQZLDIXuXpE/SsfDQIHiHKWS3eY6fwZzPxZ90YA8C4
         U0P2apch0ypCvvKq84wUtBJ+i5ARL7YiJI7Vt1ZAvhSm9dCVAyCJS6qR3KVZTwaIWBGd
         Wpy+BgNouFENCtaHXDOwIc1liJPMdi4ZacAGdzMdpuem5FtgdhVXLzkzaGbt3pcsdiR2
         IqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353213; x=1793958013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=La278T1NrCS4XO98Q/cTkbnnx/6adToIXrUcsW5BqDY=;
        b=kBIOJ0v12nbcJNl67cpY6jOTUAis2RGPGhE/MvpxpdyFSjfTwqkj/HFGbcUIIBeyjS
         vHU+JC09vD00HSC/dd1QsqugEQG0xAHiavOa5QemWDwgM0lFlfZC/0pCmK9HizEYWW54
         6eVHTg0KfGJidh07JbKR6SC+kunsZ0EevEMkSgSAeurp6W2vGbMUErBQ0Qw5dYVCVHMn
         Ie4cFWgFkQzyx4l1HDxM2C/krNODGd56X7tSKHrxvTo4JoASyTj0GVkD8Fs0Frsg5Nex
         bM6Wyj0oaEJOyQHtvePzDEvA2cNdiHWjiiicuaCHDRgHFvybutIgQUL19AJiCcNEdnpl
         hUUA==
X-Gm-Message-State: AFq9FYLmbbdogK5Kj/gbAJS7TfdY+ugWSeHQsssKHnHlW9yN/oEr4Gbp
	QvupZMXJQUcT2GODEhXpe9xn0zRr+qj6P5wV2gbM8JnS/c/QIOkATpd1xEjqjcTkuOw=
X-Gm-Gg: AYBFou3fQfcoGU/AF+wYyznLYLSZ9ZWoS8cM5J8XqigGoRSS3TnPYpsHAjaF3qdsCXd
	x1vZAdKEV8ij+AA7BNmh8vl6VLsnc3IJht1aoQN4zMtB5+PlHLNMzzi+I5wdVRSLdCyMX4y2v50
	XsIU7HmaR5T5UGYiXNQW9iuRKFYb6Od7HrgKsIxA+D0C8VK1oJd1zpdKLkFarRjXlT8GFIgR9Ob
	SrikdOHGO2ZDO77NYV/7HAPISbNRk2UafvbtyaUFdz7voHZkg8r5X/qe9vQyu/vgPpGztHR/hzc
	qmvX2PztQ61zvbo80F7xstgP3NaBvbTwEMUlm+lLx78qlfzHh7zAQ2hHXR9e/Qh+cOB6c2gGOP2
	ZgaeJi4ayu7PduRXkkUEUwgaDSsbIwdU0MGD+fzTwqvlPBJ7/m7c3jgnd7Q2H1GJ2Nw4Px2rcHG
	MyvBBoN5Fvy+EC+p9BlCbAOhRrH1irsG8vwy5hQApLxNIem0F8One4J5gG2aW3UPPP4qzOHrvt9
	0plnNZUxzChhRPTf7seE/5/t+9+L04MHco/N7J5cp8RBTJsLhABrm/EexFkzpQtM6BYKLcN/gAq
	gWgQDXBvmYDwFJpv998M6MWKb4lv/KonldciEA==
X-Received: by 2002:a05:6512:668b:20b0:5bf:da1f:c390 with SMTP id 2adb3069b0e04-5bfda1fc9c2mr262942e87.36.1793353212517;
        Fri, 30 Oct 2026 02:40:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfdc08ea60sm221364e87.33.2026.10.30.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:40:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <auRl4VzVljAQ1Suy@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <at9nsxtGOl3N5PJR@FV6GYCPJ69>
 <20261026161220.GA1671235@nvidia.com>
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
In-Reply-To: <20261026161220.GA1671235@nvidia.com>

Mon, Oct 26, 2026 at 05:12:20PM +0100, jgg@nvidia.com wrote:
>On Mon, Oct 26, 2026 at 03:52:30PM +0100, Jiri Pirko wrote:
>> >device-get:
>> >  request: {}
>> >  reply:
>> >    caps:
>> >      evidence?:
>> >        min-challenge-length: uint
>> >        max-challenge-length: uint
>> >        max-total-output-length: uint
>> >        objects[]:
>> >          blob-class: evidence-blob-class
>> >          format: string
>> >          representation: evidence-representation
>> >          max-length: uint
>> >      mr?:
>> >        mr-flags: mr-device-caps
>> >    info:
>> >      $extend: device-info
>> >
>> >So.. how about could we drop the sets, use a direct description of the
>> >layout and do something else for the ID numbering? Maybe the numbering
>> >can be solved directly by only listing the names in:
>> 
>> I didn't want to have a lot of duplications. Netlink show us that the
>> same attr, or attr group (or nest) is often used in multiple ops. It is
>> not good to repeat them each time (multiple obvious reasons), so I came
>> with the sets and groups. But I will think about how to make this
>> possible to be formatted in more readable way.
>
>If a "record" is re-used in multiple places, then sure, put it in one
>spot, not disagreeing with that.
>
>That can still work out with a clearer top down flow, more like C:
>
>records:
>   evidence-object:
>          blob-class: evidence-blob-class
>          format: string
>          representation: evidence-representation
>          max-length: uint
>
>ops:
>  device-get:
>    reply:
>      caps:
>       evidence?:
>	 objects[]: record evidence-object
>
>Jason

Okay, I like it.

