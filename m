Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266379;
	b=siH5zR0vRCcAVobpQ5Mq6nOO+ur5hWj5VoBaQ8IT72gLFZx33kouGgRSk1QNyP7CQZ8I
	 7RyA/T1ajdFSFNKS4YSsksyvmpHcR5Wh1lb+jeUv1XoC7aNVFzPsicAPogHA4t7mbu/NT
	 tdQNJK86fw7lQS3m1XhffZEMP/c3XT9+U3L2iXLMjUBfm002LUiRIku/Tu242kWxNeihm
	 GOtKfBNiiGw/vTG3odBzvO2NIC8iwQv946KffabMdcS0S1KPrTW5io8sO+ODxG7w55rDf
	 XL+pjioK4S9UKoZ/iF+pH1k+iMnLdUfhrjD1l8a6pdNVhpD6LWiP8zLEsgn8aDrjHIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
	b=pteJs3aWEi2EfGqYLLoAKqQ9fCPdHJesC0vB/sHv5t2oQTH/fbLA92IB5EKW/zbIbnEp
	 FLu4mRdvY7dOgwJH5fe54RFSJdb+fx1AmUFO2c4U7S0H0NO/NDGcp1+LtsX2/UEBTG8RS
	 5+AAl8CMBZTYLV86hwoOVvWpZvHdbyeat75UC6O37FIBtq1cJi5TqT1aroCfUPrKL/sfY
	 /9O/pOIdcZKmEiuGe+IuUxGgs24UEFfSEbSQuZxNp3afi8qpRSak2jq6aBoymO2wbA/fT
	 oK0QQ0tUZi6AqY639sw9E9RGM+fSuUYU7g7Md+ie7pnFlkNLiIweUuwpsCbWaJzRxbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=pS1Ijqgo;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA375606A31F
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 09:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA375606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=pS1Ijqgo
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19101025e9.3
        for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266377; x=1793871177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=pS1IjqgoyvIk2Eia+xOg+bymLiOvvsUc2xy2qdTtDXBVk42qPmCNNJNiZDJB00WxkQ
         pKAe3BwvG8D5VF6II9XXcn4RQ1ImdSo6CQNAk6P5aRrohYsLaCbbmTI2Bx2n3UHPaMt/
         dnyy3mSMwIriPmCZ4QRpWrVTSAa+Ci1MbJQmCgailrEMEQqY/dFVzRbiQzK1teuSlhHt
         lRodEzB7vJDmEfCOU81JrZYecVgnYfDXC6KtHz34W7ZjT/xYmQd+0F+0pyL2mJURlB97
         QDOeMskkv2NE22pS5tTnhiSodMH+yjNkS2OS/0L/iF03Rr2jzrolU+ZWXLhAyimF0TwV
         91uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266377; x=1793871177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=Yl/F0luXpYcBfYPpsjTKfFx1/O5iSZvGyWHhBgRIkhv3zgFHx39iC4QKnAxrPuWsbv
         2RsFIoRJjtQbLnYR2o0vmKbikBAOfcx/QtPJXSb7KEOOYn1iMxEk20v65NKheOBImANw
         kVN+lw+9ng2piK236z0ayMpavjEPWQsgEIPhNYgcOQfXx1rkILBgtMGAIyQ9d/8k+3Zt
         hADOKXKR76So/u8Dl4sfGaA+AJLt4pMctPi61Gqo+OIld4FxSILN4JzVK5izg8MANt7N
         xQpDhxULBDTZmBMwKIB5TA17sOIb5/WsqQdIEuZANjauYZ7lrVJtsAIjkh36tmxPcPTk
         pELA==
X-Forwarded-Encrypted: i=1; AKwUvBz9C3MQ19inycH8ynTBzILfPhvo1su+itjvOKUst+q11OL7beoOMZsjY+ISKTg/tX5ZtqkBU+2/gfru@lists.linux.dev
X-Gm-Message-State: AFq9FYLz44ccp3qwI2JmV5H3+N1ZDQ4T6QHTts0V+QqrFvfDLT6P5+JQ
	pzpS1LUEKjvJqxiEXUb7h+l3WJHQE5PV3hL5ZFBUIQedxtiXb2D5KsdvGc6ruG+oTmc=
X-Gm-Gg: AYBFou3+YGkr6FbVuRC/p0KWYe/LPZjbnNkw1sE2aJKedyZYpaU3Af9wDPLreUyvPV3
	YNPn06RUQXtdq2W7r+OczpclWDHeI5Cv8ZIITJF/tcVBROHu67USDK8QHXWErqDtokkeBFGFga/
	xbHht/Mi1lmfu5BUFyhk8YYA8snURSyWMqOxFD4iW3hodeqCtGNn5m2Wd8bn5tgwiyH2+qWKQuw
	cn3E3OfvuM5UZs9bLkz0hzz2rMt9QKxbkokyHH/r8MzkwdCX7YR1Ao4GhCOTq5vI+8DkZOL9yb0
	JujwnHI59oO89w28KA25UirbqwObGXBIRgE356lP5v6z1uC+hfOmq/H0lcmKt2ngRRTkpCJKErh
	ofKSVCxVKqvwCxcZ9HGcS/qGlr7EnKmE0vdH73GSgAMl/dZ0XC5ffcqBvIN0NQPLYR/Ak/W/fzm
	zvxn6PXJMOP0fAg34vyVtSoR+Gw58l5XqmOcHlGgl7JHdVaj8GAX5owPtZBBRZapEfAY+qa7bqP
	o8RRgDu0uCJEkDdRmxAulirjNW46Y9dwBkkSoQuO5Xw5ByG2QjT756tMt6J44VrnM6DBtiYYvVD
	gUpnokL4z1x4BheovmLwK4+AWy4O6eTAJ5KedA==
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr104826795e9.28.1793266376792;
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm52889635e9.13.2026.10.29.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:32:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-coco@lists.linux.dev, 
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
Message-ID: <auMSPNNXZv1f43v7@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
 <20261027234658.GL1685504@ziepe.ca>
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
In-Reply-To: <20261027234658.GL1685504@ziepe.ca>

Wed, Oct 28, 2026 at 12:46:58AM +0100, jgg@ziepe.ca wrote:
>On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:
>

[..]

>
>> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>> >>    directly, which gives 3. In a real TDX guest it fails with
>> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> > 
>> > I would have naively guessed this should inherent from some SPDM family?
>> 
>> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>> directly, so I think the test's 4 is what's stale. Jiri would know for sure.
>
>I think TDX report/quote/rtmrs should be a different familiy from TDX device
>assignment SPDM. They are completely different things.

correct:
1) ctlv-attestation-tdx
2) ctlv-attestation-spdm

The spdm instance is backed by particular implementation/transport.
