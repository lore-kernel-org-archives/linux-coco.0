Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78B439911
	for <linux-coco@lists.linux.dev>; Wed, 29 Jul 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318336; cv=none; b=cEOVsqUBpLlXK50rb09e9qm4w7LTMAkZ6k6XVxY4byP0xvpIyjcitDxjxNedCfrubNFJlzo+uHodxgQSc5xhp9Qqb+U+LvsrhJ2YapOsj8y6aiURVTVHW0U+gT6ksAtW4GTjQ9g8UMyqypAqKGA4H3lfyym9fhYDWTHizpCA78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318336; c=relaxed/simple;
	bh=GMdRojC4getezRxbZCZUJpdJsg0zh8WW9ZNZ6qu2MJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCZ4rB0x9i2CZDWLJMQZsT68bLC9P13z7MJlAnsj7snPj++q10aA1oPv00dsJxbz8bO9PL9uA4Fd2PrAgz0s8kZNyP+g6NLhLFmAx11gs02qlo82S6JPvB1Vel4cLFLoufK+qaaJDAv1AWTMw6P65WVQwXp5BY3kF5qsOkKBP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GesK7k6h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GesK7k6h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4984575e9.1
        for <linux-coco@lists.linux.dev>; Wed, 29 Jul 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785318333; x=1785923133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=igJ9eFf/g9Qha6rSnSMr+tVg3JV447K84mS/8L8JK7M=;
        b=GesK7k6hzv3NjsAGztCr+wXhL1inJzh47/EHnWKLUj0xcmMn2D/U6owhvub18V1w/m
         qWPbBopir6/VNHkRQBawlGT6uxG97NMSJqtevLp51k0jHz7H1ktrfn7JL+fRki6VCKsF
         1zIaLslTwBdPlrT54cMIfiPa3UapuEiLBAtPYXvP9UeMgpOraupzKDtmoey8DxTFhr1l
         srrehULETy4z3Va/O4IUC9hq5lWPz3vSQLehLW7lvYzWZyBXnp2hSbI4M0HWF5+4ZYqW
         aZK6VpLp5gKzjWJzkmGsJ77wjzIn08kNgNLtPc/Pw11tXTFNjl4AEvIGNzfePQtu6mKX
         vbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785318333; x=1785923133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=igJ9eFf/g9Qha6rSnSMr+tVg3JV447K84mS/8L8JK7M=;
        b=L+G225CDv6R/XNP+4WZJvd1NaXF/elzsjBPeeM4LstBHw7MIkgA3XEhFIupqwlQWzD
         SFUWVYiSssGjlV/V5n1ONLJ7Mlqf1A3BwHWIu+oYisyzCMSHg3k4NXYloZiREAg0AsG5
         d9wHDw6vWHtGv/kkKy971cL66jE/RcHgww5P5ksOPdYc/wcHkYV22oCGc1VYWsbajvzX
         F52KaUZra3ktGE0UmaKV00Vaadxuu4ho5acUg5Jz4/6w1pGzUYbL2bLvpRtgvdK7kssl
         YBLl0XyJQ+FJVXIwpY+deAPthn9Qz1lr1E7dOzj8UzZtuwdhlIvm1LMohVLq2dLjXFHS
         zVjA==
X-Forwarded-Encrypted: i=1; AHgh+RqrOr2qHtuXBG3nHcCe8hOxRIHLEdwWdxhrIgWl+6S/DS1QoTGMyQzjx6F1/0nc0VGX14KAj+44dUKi@lists.linux.dev
X-Gm-Message-State: AOJu0YzXBFrR0WtH6m/3yIRWlbwdrw7USk88fshkDrZd3gOu8QKzhhKD
	GaKb9O/dVookMoKW+D+0taj28rsj8SXOGxNQdqPb+aVDQactbYT0yHv3dVEU2x0xKSg=
X-Gm-Gg: AR+sD106gaXsJfDBCztayFPTeWzIvW+wZhRn9Vjo2wPR5kIOQz/bV9B9/kI8pZ5FEQq
	TGJqR0fpIxgunAfhmSqH3WL//kEsHcEXNasrNCWexQcSMScJLNTOR1eFWM5xAfSIsnaIFxJQ10x
	XkItFfSxcp6axUACiojseVx4+SJA9w3/jXMTJ5xh3yES1BUlGVOkh+Dcecv/pA68PmCe/li6ZIf
	j6D9Eh/agppvWvTpQgStGY4dapjxDEgMoxUDFckDiURdJgPpXko9l/vzWc7K/2GKECm4CyI3C3z
	QtUnOOxV28Po7sillqlKuI6QA0uAUkG8M2TRsX+ZStzXJW+lDtUvTwZaEKQTuVa4jai5S3V5CTy
	8QXxG6BhYtg/cpFZY5GjQoAsMtmpZV0Zsr2+UF0oRU7Uyg2bXWq01PLp10jOq8uaML1aZjJ/1xg
	OM7r7dIVdrbm+znPiDcIjGMXg1fHP2oqrr9ApQPDcLJpiKNHfuWBkHyuwX884gq4WGaC0d0kWlp
	lI=
X-Received: by 2002:a05:600c:470d:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-496c6431be1mr64251415e9.13.1785318329556;
        Wed, 29 Jul 2026 02:45:29 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ac44bcsm6208172f8f.11.2026.07.29.02.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:45:29 -0700 (PDT)
Message-ID: <a403b696-00c4-47a5-8738-f49e3942d92d@suse.com>
Date: Wed, 29 Jul 2026 12:45:27 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: x86/tdx: Do not print error message on
 non-present feature
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, seanjc@google.com
Cc: linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Chao Gao <chao.gao@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, linux-coco@lists.linux.dev, kvm@vger.kernel.org
References: <20260729085908.21368-1-jirislaby@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260729085908.21368-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/29/26 11:59, Jiri Slaby (SUSE) wrote:
> Before commit 165e77353831 below, the kernel did not print anything
> during boot if X86_FEATURE_TDX_HOST_PLATFORM was not present, unless TDX
> enablement was explicitly requested via a module parameter.
> 
> After the commit, when attempting to load TDX automatically, this is
> emitted to the log:
>    virt/tdx: TDX not supported by the host platform
> 
> It is emitted with the "error" level, hence it is disturbing. It is not
> an error to run CPUs without the feature.
> 
> Drop this silent-boot-breaking error message for the automatic
> initialization path.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: 165e77353831 ("KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init")
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Chao Gao <chao.gao@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Sean Christopherson <seanjc@google.com> 


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
