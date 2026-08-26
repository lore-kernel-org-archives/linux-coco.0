Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD053D5660
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737902; cv=none; b=Ld+uBXmJMOrr1dEhWxk1T/QyaI0TBEizGMK+2pB1qBsLzZJOpUWrhmI6WalyPzXCw2CH6L/8vue7UZaGHU5mquems9GdRzp0rb6ODo5H9DgEdcFT+Rt55weo6XDRTYhoYwVuaiVPFpRvtI1kacuHKm47mvn/h6zHJhBaxP1xwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737902; c=relaxed/simple;
	bh=v9piU18lZ/lb9fnvVLpa9yM8T1ZB0s+iYSi2lwWzsEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDUN6m9enNhW2/n8lCJ5iGZswEElYpIuKYOsgS+JTc5m0qTGlyQX9zPuXrdOH38Vt196HQdVvz/NHjQ5paezzUzyIXHcvzJBoP7LATSrsjOzKneyoa+QbRACwVX2VHaqyEAkCL3fPLFfjFYn1fClcYONvRTuDMFDzT17Qw4/t70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gyu7SC4o; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gyu7SC4o"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2529b3139fso42634866b.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787737899; x=1788342699; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YHCoJr/FzmfjS/OK2p3bq3ZjrRpL2dhX1kSlnFW6rfk=;
        b=gyu7SC4osSb4BbkPrTJCcAS1FtIBp0IJmztXuF/CkHgBa3eeSa82SJgtuKtcBwRh4s
         wVpJOej+ZVsIAC4WN+2LKvpd8V6o2irCzRPHWa5C2UvimLohYXeDc5PsdGJr9J+9tBa5
         rsMwSBan9FKDAw4exWkMEGUaBbMRwS2N+hfEaFFoBrAbaVxP2Zicf2Df8KqTG36e1/2Y
         Q9kEG4d6xZWHlWAFQy+QLnXZKUMelC6zCgBLQ4xTdBeFg7oCyOzQpj/YiLkusFsjN2mX
         DzfYECqM//ZsbiwGuA264KTJGMQ0Xvmao/HD79XulT8HHGf4hw3EoHYzuRcrDQ5/gg4t
         /tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737899; x=1788342699;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YHCoJr/FzmfjS/OK2p3bq3ZjrRpL2dhX1kSlnFW6rfk=;
        b=PffkFBBMVFT7T9DT2BZ93FIUifOxq+4gtBICFDy0SFQSyig7E1i/J94gOpl8EkvMOg
         5Qch6PGOXYCemcUd7+3BcpyWZ3loVBl2e9gyCgdZNT718JhjLjfE1fHNAzXgxQfPfFHX
         hRs/qo5VMhe585OBHnskRzjy1tcW9Os2pbLL5PiiWSoJMZ5/Yy8pcszCAx+n9UvXNO1H
         /TLkC+aSyKSR+fRt7IuaIq1oBpEI9O86MNtrxf5eV4U+fGqeCm+WDC55ez4FS7/Tmuhb
         qy1HST9nmp+yg4YXOfHCGWduYeSpYU6a4kSrEiQ8t1CJX6i3oYNU7g6xj2If4cM/wn6z
         PPYQ==
X-Forwarded-Encrypted: i=1; AHgh+RofWpWvd3jQ4tNHXKu21ZEcfLp3xX+MkoOkrMCcEsWWsAorM+sO+6oz6vliZOdMrS+231ltqZb1sL4H@lists.linux.dev
X-Gm-Message-State: AFuF++k6zKNPAStGXGfN1WckfoV8ikjcM6i7tBlubUEBSfDkbptr1ivX
	6NdHHxCLV5/4emJMJV+lt0un2mZwWkU4nKtgyA0j4I/rvJamG959WjFROFGQtIaTF30=
X-Gm-Gg: AR+sD119H2X3xSVuTwE7ZQC6cP8iB0nt+jjaU7oc0Mt3PBajIPTq5+VRQA6fQ9W80TH
	OGSnSjRc0RTygF8XM1Euk7BpHLQkp4whjPKa4ZJ+Y09EcCDwU3DYBgbPBjYRq21bLsB+SOwrAUQ
	DS2+V98EED1dmZu3+bMqh8/9lYkEZ4pDJ+GpbZbuaB1DWF3JkWQgoBzfvMcbZeu0syhSCptGm9B
	IAo6IDGUE3XUkNWVFsl9kuExj1y3XzdBOuwyoXjRcClWFNKHWhxs9Ec9TB/cpQj0bi3nHzmefJY
	4SVe0ei6v+GjsciN9AzYEfNgiI9DHnMv7wcDBJTDu3EzfyIUm2BYG7vu7nD+WBLwPRo5k4OmZp4
	ftDQRPJmkHvqQLYEqW3egua/jIh1K0FRHNEvHPBC22YAIL2+5rR2sVKU7vGXzzi0bsajWYlnM0l
	x/BGO9/qJ1vhapoprKK4Sy0qy5GxPt0BsChwEtB8hCSyihng/sm/2/gAwWWcG+zwY=
X-Received: by 2002:a17:906:ef0e:b0:c12:e178:9e68 with SMTP id a640c23a62f3a-c250c3292a1mr623262666b.19.1787737898915;
        Wed, 26 Aug 2026 02:51:38 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a704e55sm387662366b.21.2026.08.26.02.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:51:38 -0700 (PDT)
Message-ID: <99dd1836-55ca-4302-a81d-545394673702@suse.com>
Date: Wed, 26 Aug 2026 12:51:36 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and
 TDX
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-10-xiaoyao.li@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260819094903.3060020-10-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/26 12:49, Xiaoyao Li wrote:
> The exit handlers for VMX and TDX have the similar pattern. Consolidate
> them into a single vt_handle_exit() helper.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Changes in v4:
> - new patch.

I created essentially the the same code locally after I read the 
previous patch as the code duplication was killing!

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
