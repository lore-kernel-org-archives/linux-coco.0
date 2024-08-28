Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B4E16C869
	for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853243; cv=none; b=gyUb6v+zr/H8CVMYo/gPR7GDqkLqvSBdVQWNDcTMpAZqebkQ4rti+wLKVVHiXbl8gFQfjjeQN3m3r6AVXPwKb1OjB3hTmg6MMVhzLku9Cqdr6O516G0Z9uv6aMa0Xy6G23OaEpheV2pBbEXQAC9diFIMIAxNWpLuQR8GGqeh+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853243; c=relaxed/simple;
	bh=y02kOSFsk9Ovek97BpXGahQxjqkYkGuGhI+KoympwwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ+rKpK2TO4x3rqt7lsPK66s/h+YiTzsDJUu51RCzI1b7K89HTc4L+hU73vk3XdiTGr5oMeDfJyRJcysPra+iv51zi8AyJ4fBAMIhyu3tJaZF2H3/LHX11o1DU3lbahfM7cl52gbI4+bv1lm0UtVbL/H2oUjRP4EsSqyEuqCYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a/uDS2y2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a/uDS2y2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a868b739cd9so809203266b.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724853240; x=1725458040; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=At58Bl9125tzbTcmwgBJNqywpV1jLul1XrCUjHhQfkc=;
        b=a/uDS2y285YFKjhnTQPSBoygwLmLSjLV3Hkbqg5tHGHJGJAw6qEMIgrPpH3yD0lxoJ
         whFgwShp/0lETLnfLAWevSds+XT0eT6fUI1NIAMvbeTdoAUly+wRCSSmNDnf701+Ol83
         /EYhyytc+U+BGp0s6UhYd13pNMv8sfLuP197QizZwtuHZWkkpGhlqksZh/YYbkVsz+eV
         /kqitii2o/sBVz5+snUWNITDYOmC+yZ1S8JAJTmAzdfRaanuoGJfFCcwG9AxWs5EN5Dq
         nDQxqXgYVZ35WXO0niTSrZjZ/lJFck5imAwZBYbUyCZ/ci7Pmwu2mr6pm9xBzYb6I2Ug
         SOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853240; x=1725458040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=At58Bl9125tzbTcmwgBJNqywpV1jLul1XrCUjHhQfkc=;
        b=diKCyjmM9nQWo2/LfgmeHcAW6Qe0qDWDD4hj1kh0709zD6+PA0+qe9Fh03qLX0uCQ6
         Sc8lLKSEIcHGjA0/lmJPed0NM1cnBeivWXHGozshyLTrbcJJG9HqHR97QQJN+y+B34k1
         PqbQNDvnS57t4W1vCud8vNVo4Jr0PjQiSXY7ey45qB+t0XLVWyt69se/SIV9c0wo0SE6
         o/f21AjvhPojYFZ/P+Ln28QQBY3c3BW8H67BT4C/8RAU5LEAhV+4nJcx5xIBo+uRgtQ8
         fm5QhAgBdsFwmXrsnLfvSKdIdvmNFoW/sVpkE0YOjtwWQ3i7GtHivaMOGs4eNxp4HELa
         ko7w==
X-Gm-Message-State: AOJu0YxGx2sT+LsTuh9TWPFCDmclPZtsmFW3aZpXm/xA4JYitpQ0duv/
	cbQiBfN1UIdPIMdPIn1sSOriOtn7aHyz3enxHoKM6ZEMoAjIcQqHX34b83IiqKM=
X-Google-Smtp-Source: AGHT+IFzCP/vvijom3OckXK6Naejo4uIiolIi31SLZ3eeK6wIavfO/bfj51BVIOfiKhEGMHey8Vawg==
X-Received: by 2002:a17:906:f59a:b0:a86:9880:183 with SMTP id a640c23a62f3a-a870a94fe3amr168921366b.10.1724853239725;
        Wed, 28 Aug 2024 06:53:59 -0700 (PDT)
Received: from [10.20.4.146] (212-5-158-46.ip.btc-net.bg. [212.5.158.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e587843fsm247147766b.153.2024.08.28.06.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 06:53:59 -0700 (PDT)
Message-ID: <e042faa6-91be-49bb-ae59-e87792756fa4@suse.com>
Date: Wed, 28 Aug 2024 16:53:57 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 2/4] x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kai Huang <kai.huang@intel.com>, stable@vger.kernel.org
References: <20240828093505.2359947-1-kirill.shutemov@linux.intel.com>
 <20240828093505.2359947-3-kirill.shutemov@linux.intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240828093505.2359947-3-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.08.24 г. 12:35 ч., Kirill A. Shutemov wrote:
> Rename tdx_parse_tdinfo() to tdx_setup() and move setting NOTIFY_ENABLES
> there.
> 
> The function will be extended to adjust TD configuration.

<offtopic>
Since this deals with renaming, I think it will make sense to rename 
tdx_early_init() to tdx_guest_init/tdx_guest_early_init as it becomes 
confusing as to which parts of the TDX pertain to the host and which to 
the guest. Right now we only have the guest portions under 
arch/x86/coco/tdx but when the kvm/vmx stuff land things will become 
somewhat messy..
</offtopic>


<snip>
