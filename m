Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE63C945A
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872489; cv=none; b=OrUF2X7nXNqCicJ9xsaZl1yODDyiusoPw/vy263EV2jWW9wEor1HDGYmPZIVIgkKH5QnA4AeHU1DhzFy0BkVUmn4UTlqHw0TYiDDSYTUnd15WiBPfYJdcLxCivB+zxBQjWT5mx+8vp1YQQHJBQdV9zxk5fpApILWh2yGs8vxT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872489; c=relaxed/simple;
	bh=ub7p2AvtgHDlyXYYb3wPWRrL+7fdxwouzEwE+TG4swI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfMCkMFIGG/qBXi6EyUVTywgANSoQXNjHCNknWWM4WjJPIDR49MQOI+Z2dLSBtZYaDBKTvmdEb4H4vYpESVRs/TSvyuokzqEFYN2dW5cJ1Mjcm7WrWe3eeWKDd6yfQswf3poTQreEge7C1V7ZTHO0HOaen/DGvT6BkN7/gi6r3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CazxVP+I; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CazxVP+I"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so42360135e9.1
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790872486; x=1791477286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2XF3uKaHdG+8ZvOmrRUZMGcZKEjSK/xxMzPJWRXrSow=;
        b=CazxVP+IG+8+aH1tgt1N6KJkHJQv6pAi7w9sMn1hyxTgnpYTkcS2uA+HEtPKAuTXt/
         4bBKk4crBo8bCHzgaLeNsQ5KqyDDNSr55AQrsx1LvVzBydGz3hdxddOahvU0N6mMk5Rm
         qGLe+uXDInp/LAMzroOai32NloVCJUXOHvIpncl4oxFJNnaIM+dU8wVVoJahu46W9IQR
         eZvH6CEtyI0R473SukALMAdJsu/CPUD/DmTQwzwoxqUGPeFH3/1m2jqf0LW9Pve5OvlX
         eoJCgqxTebvQlK6y6T0UXcUY73sAD6E4h1VTHBRJyOAV2nEViR2FTH7tjPZ+jtQhjL2U
         2dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872486; x=1791477286;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2XF3uKaHdG+8ZvOmrRUZMGcZKEjSK/xxMzPJWRXrSow=;
        b=cB2J1DhmjeFLeUX7Gs/W9W9Uck7jBTixJdnYEndnk5vh4MFXPfVM6I+DYdV5ka1/Zn
         y09wkp1vZM2NK7BDatqzANU4F9o5FYFHenoIdA2xtEayrKPmu+GKJWAFRldnyQ+hfc69
         vF9TH4wlJl1mUnqhUMXbtY/Yu4GfoRmfhCG8E+0Z4fu13KrkrG7Ihu2P8wA74JQvknOa
         narxOMwMUwQs5ChwFA6q3qZPrk2f5n5vl/Gra5C6Rpwghv9zZVTNVdemzL5dnpSGiWWS
         mPr/qLATx1AtS/88j6bc9LiKUb4l/Xp+lKoYTrLdlIkLS0fMZ5pk1QY9m3M4nYmghEdQ
         NAZA==
X-Forwarded-Encrypted: i=1; AKwUvBwrsj2g2h7semijQz81HrdxFN6a15uv0s4OHjhprcSbQvqR5ttKqd176nHXivBxwRPNsdGvEn0znoOT@lists.linux.dev
X-Gm-Message-State: AFuF++lS3gR2aocnN0+SQYBL2WG6P8i0oRrXfR2S+s4oAFeFjxT8C2oG
	lYJqFEDqOcmnd539SneHLWlbOZLN9RwSaQvR0mzr3B7H1uwQo2V+//1me+E5EsIgwyQ=
X-Gm-Gg: AYBFou2fPwXzt9t83GxBd5j6cNmZaNoEdDrzsEnHp7gRO/Q0rraijRgoI7ttZq83lwJ
	sbqnBUsNpa9UiwGWzN+cFw38L6jreImHdFqFMiuTGDV5mp/e9miACWcJKg+yTZKyzuiDOVWWodr
	FAkcC/rO/g/JL9d+0EEyQRnWnd05bHYrMQ6mCAc8MKwRqbxi2/cau8y6U3453R0zXwkLkTsBST7
	Amo/v0KqjH1MbMGZw/+KPvr01RYYQLBwukIJ63Si7F6bBTxtvggA8Y56SdEiqYvXKKKaUDB7uQe
	Vr7WhJucQVGuqa24s/2Lr+kFPEd4qHG6UnmkRlcMOi44h4SHPa4ng5O1FZjHXXbh+vGzSua/hcv
	IkH2KR5H0lhLNucP8jpTwHMghrUez9aDqqf8SKn+Oz0E+M+T94oo+UwWSSG3NNsur2uSzWFoFUb
	Zlr6OmZ51w1uFme+UndXU9B7/9FbudwcfRdshEAwVO9zdFGBzDKaMmr1JsZnf94ZqvmN6g9g7yt
	RAuGaNntMhZOl85E97wSPs=
X-Received: by 2002:a05:600c:c16e:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a02755fd8bmr2940795e9.9.1790872485794;
        Thu, 01 Oct 2026 09:34:45 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm38621205e9.2.2026.10.01.09.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:34:45 -0700 (PDT)
Message-ID: <ca464aaf-1935-42ed-b486-4f4cb84ecd2a@suse.com>
Date: Thu, 1 Oct 2026 19:34:43 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] x86/virt/tdx: Convert the td_conf metadata
 reader
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Gao, Chao" <chao.gao@intel.com>
Cc: "kas@kernel.org" <kas@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
References: <20260930053901.22528-1-chao.gao@intel.com>
 <20260930053901.22528-8-chao.gao@intel.com>
 <763dcf982570e0ffcc69a6e1922fd2cc266539aa.camel@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <763dcf982570e0ffcc69a6e1922fd2cc266539aa.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1.10.26 г. 2:54 ч., Edgecombe, Rick P wrote:
> On Tue, 2026-09-29 at 22:38 -0700, Chao Gao wrote:
>> +	/*
>> +	 * TDX_FIELD_CPUID_CONFIG_LEAVES and TDX_FIELD_CPUID_CONFIG_VALUES
>> +	 * give the field ID of each array's first element. The remaining
>> +	 * elements follow consecutively, in the order they appear in the
>> +	 * structure.
>> +	 */
>> +	for (i = 0; i < td_conf->num_cpuid_config; i++) {
>> +		ret = read_sys_metadata_field(TDX_FIELD_CPUID_CONFIG_LEAVES + i,
>> +					      &td_conf->cpuid_config_leaves[i]);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/* Each config has two u64s of CPUID values. */
>> +		for (j = 0; j < 2; j++) {
>> +			ret = read_sys_metadata_field(
>> +				TDX_FIELD_CPUID_CONFIG_VALUES + i * 2 + j,
>> +				&td_conf->cpuid_config_values[i][j]);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 
> The comments are not strictly required, but probably fit into turning this thing
> into "hand coding". I think it's a nice addition. I wonder if we should make the
> "i * 2 + j" a bit clearer though?
> 
> I'm not against leaving it as is for now. It helps that it doesn't morph too
> much from the code getting moved. But I think the above falls a bit short of
> hand coded quality.

Perhaps this code warrants open coding? The code will end up looking 
like config_values[i][0] ... config_values[i][1] ....
