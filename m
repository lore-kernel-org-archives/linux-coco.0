Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C1503BCC
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791893421; cv=none; b=XjoECMOceyJIxw88lpPTuy8OoDe7CNoM/vhSuWlu1LeQJ4qyrGCR7KYjGesn71PVXq9RQXdt5Rkap01d72kZXkqanb7uL8GxFcNem4odT6ls0PwUXAUAnMBrm12anXG9xXVix2YAKmajQtIZ27hwOxG3Fh2iZhGpuBSmJt+w2I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791893421; c=relaxed/simple;
	bh=QQ9cUlAL5GrQVE7+llWDMD+TIOINbzuGmvLlY3iiW78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tp/Tg1wIylrVdx8mowb+bOVcYOdSRsk6aRFZJKW9S2U0m2v9iX5+Vy5ureUndOYxJ/Ak/bwhVMEh8S7plaQ6ZMTZLD2/DNkc/j6iapPz7H6x8Bzye96JCxQzNNVDcXEhgDN4m16t1cYbXM7H6jqsO+Mt200sQCJZ9FmavYmmKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y8fAvGJ6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y8fAvGJ6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2039551f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791893418; x=1792498218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UW4M9bzPF+18n4TtRgobPgbeKOcHx2cqh4rjh+zCS4=;
        b=Y8fAvGJ6B4h0ayBXifsIGFqBxbQo1hZ9ZQm0GBMVsuC7p0z2SzUJH72Vo5Ed/5VaJB
         dWXxR7Uh31KbwgL1hl9ypHWgUHKtGnjPpFH5tCgQXXmxAVAY7tNV5gMEEp9+f/fU8R5h
         IOLApsS3e2kS49SVG2i5QEXSa8vQOkE3jabM+nt/Y8KU1x1VrsPLP2ejG/yKVo8zmueq
         05a4pM9L1KWDgEwDyUAvLR7G3jeLf8JtlEiFCZEmxsSKJWnAstFgOuTthwO2AJ4cZ3xF
         VrRa86Ua4nHCzrubS2YfKJqqfIFQGHsUwQtd8T/Jto9W+3Jm1iiJFbNFbXI1eIZ4Ff4a
         wo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791893418; x=1792498218;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/UW4M9bzPF+18n4TtRgobPgbeKOcHx2cqh4rjh+zCS4=;
        b=Ypt9sspQccQBKoMG8Byx8VzNKnAqODOq+FO0O8HhEUhVxKaXe+pU5ufDxgVcrj1CaZ
         apTOUw6mQGh4WNOXZKvrfeEQuQN0gj98HeYnbC6eJrdoPWUFsA1mtFVSsn+wyPRwH+gb
         prG2lvwPmrZwJexmosVkEm/72gCZGijAadZ5uQuQh63ZT4r1IkS5UfYJYcqij9aNgElj
         LY89fCEq3XsP5N86oFShqakmyyj2tAm3fVq/EMabe5F1HdlEb+4rWntBjsgUQWg9+otl
         7hSSYxI0on9LKIjpRVglY+qJcPeFGyIcfe4GmxAQF75gjkdeVKakq0ZJgMICy3LPoe4r
         zrvg==
X-Forwarded-Encrypted: i=1; AKwUvBxSqflo3Ag/kMcPXVnt/IEC93YzNHP4Y6jP9lqHasKk10Gs5gCmwt5NhId8LQn/Fz6htGKcPvDQI11C@lists.linux.dev
X-Gm-Message-State: AFq9FYJsa86wkBHgFzfENvsFGP3idtj4gtfoV79rlPlpujqDA3PEa1NX
	Kvaja5KZT8sVunGj+Fm51N1IhO6Yl9i7LYyAGDgomUqcWzn4qHYIsa+RPxQaiKAHSEs=
X-Gm-Gg: AYBFou2b0Hz4eEQycWkjIxIT1sjM+BTIZKF8o8/uBxVL6rnrqemX/+j4nUNdg9c1sor
	Yvbi6EuYs4AKjS6ZW1WvHyaPVnl3dzRw0mcfGhVKGiWnYmg9dw9JCctpuL95b4+kQ8crv0dGbIi
	mR2PWQDk3K/VWOR666sBX1OVHgA5qf1VJFwcWiGkv+Ym+xfcR9lsWVli8pA1+80gXyTZm9KeVwa
	U6d44MLpFhUZkmDX4cWsh0OJFEVP5ql0kAKh8fxX1AanIMW/1RLG4TPfo+hC5GlwuULKHCawFs/
	cIYvCP9WdLNU+e9FS/uAFrivfCjPN4FCojbwog9g85ryt/mya+GPluAHJpbhJPY750xHoHIN4Bw
	XHl35pm6An+ROYJ08LLvlXjNiy8ohVUpJhrHU7lH1y6b2I9S963w/iRbeoAhFSicTN2WAroZBOt
	UpcjBNh79XLP0wUiE4Gq7Uv2/JTGngH1h9OemiKB99an4CRsbY5KtvIUF2Qkr1BLN/gLXjZWZJY
	OKHBwB733bZ0+ZpZJAqTP4=
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr14920520f8f.30.1791893418151;
        Tue, 13 Oct 2026 05:10:18 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa3fsm4847473f8f.10.2026.10.13.05.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:10:17 -0700 (PDT)
Message-ID: <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
Date: Tue, 13 Oct 2026 15:10:13 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, xiaoyao.li@intel.com, kevin.tian@intel.com,
 chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-7-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> Introduce support for binding and unbinding the Trust Device Interface
> (TDI) using the TDCM_OP_BIND and TDCM_OP_UNBIND commands.
> 
> Executing TDCM_OP_BIND transitions the TDI state to a locked state
> (TDI_STATE_CONFIG_LOCKED). Add a sanity check following the bind operation
> to verify this state transition succeeded before finalizing device locking.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

<snip>

>   	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec), GFP_KERNEL);
> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct pci_dev *
>   	if (!tdx_is_dev_teeio_support(tdevsec))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) = tdx_tdi_bind_dev(tdevsec);
> +	if (IS_ERR(tdevsec_bind))
> +		return ERR_CAST(tdevsec_bind);
> +
> +	ret = tdx_tdi_read_state(tdevsec, &state);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (state != TDI_STATE_CONFIG_LOCKED)
> +		return ERR_PTR(-EIO);

While this does seem correct, it's not really following the spec or I'm being too rigid, namely:

Since TDI can change the state any time, TD can't fully rely on the Known RUN state in any scenario. However, TD can rely on the Known
RUN state after TDG.TDI.START as a confirmation of the Interface Start.

But here we still haven't done a START, just a BIND, no ?

 From the Guest perspective, querying the INTERFACE_STATE is a correct way for TD to query the TDI status. If the call status
is TDX_SUCCESS then the TDI is BOUND. Other statuses indicate that the TDI is UNBOUND:
TDX_TDIMT_NOT_PRESENT or TDX_TDI_INVALID_METADATA mean the TDI is UNBOUND and the TDI control structure
has been removed or reassigned.
TDX_TDI_INVALID_STATE means TDI is UNBOUND or in the ERROR state (TDI in TDISP ERROR state is considered
UNBOUND from TD's perspective).

IIUC it should be sufficient to check whether tdx_tdi_read_state didn't return an error and that would imply the interface is BOUND?


<snip>

