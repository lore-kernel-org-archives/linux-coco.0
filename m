Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8D22D9F7
	for <linux-coco@lists.linux.dev>; Tue,  3 Jun 2025 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952247; cv=none; b=Y9RcKTvNgiBVPBzeBoisfApgG/8WUg/NPn9UFV01m9BzMnwtxJ9T3t8ZjoFOi/9XqF9Npc3ETQ/Fh3knY3FNXeY/2Vzm3qXNHg222M7xwz5TiO9b70qYu2oLkk85yOPY9fyAoi4PafHZMdkUOnqUBPIEv4LTp6+DDNXKf/gF4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952247; c=relaxed/simple;
	bh=eKVE11jLj8lDyZOQhotMaEk97jjBKUbpiusFQCUvx/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oymXUiIH+f95MAY4uzyExjK58ZnelQzGIZJCIVG7iF6t7XKhtRNTxUGHES50QLhFW6JNfskxhuNjftI5HxDLY4mE3kZ3kwe3s6sZ2t27BdwvxPZx19jqTtvuHyHEmzJEsp0i3ljxBbfJRaQfG1p5cXrCTGW/0R6kWJfuIN9AVio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zb6UHQ1N; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zb6UHQ1N"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so858389166b.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Jun 2025 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748952243; x=1749557043; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HDZ21hWlWv1x+o04xchdKXVEcwFizZSvZru6Ba/BmlI=;
        b=Zb6UHQ1N6kMVg9QfCt7PMiy88RCdyq16cqCgViTTZbiVPPpXHoFrvMO/hkXp6Pk978
         23uNpGva15I75gb8e0b4L94CobDMA3e5iS1q5wCV1iiuclZux6CX/+D4MHDDkgt9QWEN
         WD8W/f3utb34hDhCcM0AxURabInQd25E0AR9jNB/UsTz8T5+6SBKsM6XQAhg83LEuryn
         Z5n+/qwESlhYzwCAfp0kS6nmxZiS1LzFYvyWSGnv97qCYPwkYothkMJS0YkFrSYDs72V
         XOSi0tRI/FSA69Y5rX1Y+DWBuyt8cGSSc/UXx1rzCMr+82ihcAWMe7JUG6gD6rF5KAON
         ESXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952243; x=1749557043;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDZ21hWlWv1x+o04xchdKXVEcwFizZSvZru6Ba/BmlI=;
        b=hcgOTiBQXgayJ3Te5W0aAtYlNBLpcRuS8LlrLpPmT8nd64HWLCsaTho4E3STF1yi4s
         cRzU6qST4oUB8eld8nhPXAGOCCrrDH2UFzMStkDGW0KSUT2xF/7DPj05rJJQxOA9gOEY
         jDinTbjE9xfwHJNP6vzEuwkqG1wFza7GYBQH2vVkX8FicocHHzPk49hD7HPzua+zqP0h
         A1qp4p41PQQI5FaRWujqETmXeQQVyURtrozdjEPS3bN4ZDmlSIJ3JtrfO/xUQJd0crr+
         VYvNr65uZUfJF2rvZcRJS3+OIbdzlN74enRvqqhyHKYoWhwEXsFLV7EuuKb2qZD4Uzm/
         HQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXvrp51cpdD6Xr2fJySRKLPpKQWnw8u2071h4lnwqzfUX7BuuTKYxDaTt8TnFlCQ6AS3OzAg5JxPgv@lists.linux.dev
X-Gm-Message-State: AOJu0YzXXjfGKx3HQr2P45F1uCezP+6FogqhDrkW9RVK5ivKaweSBIFI
	1l0akcUtsksUezlhImSF93R6AeXyPVueCp5ZvxNFBpP9JGvM5mgLIRDR51LJ0bchsUM=
X-Gm-Gg: ASbGncsiOxpvdKfsw68WyS3FT+6vLwUlHG4s/BKqAuwh4xOijiFWRCXkxGsfcxLU3Mh
	nb5eVzWcbUcr6W9oP0Lx7FmLUGF3uS4ZF/lGMO1WTgAJTO9e1s7ee5cGBgimv7zot8gDEkxcn8w
	0YWWVRMPmSmd7y/m8N7ARazgUwXrtNlOMETxar5JZoLhkLLt47KBY+kACOwrNCCAdCD47tZe2MI
	e1T7jnXgVO4RdwO3cY1XfTMA38e5Ce7upAcQdCqeBati+xZQyppdHoQZPqAJ3sAhEnivOWRyCZF
	UOj2O831lueRCxzKmtzhuH/ms6dlk0qzMRy5awwpgw1zEJU0NZw+dxje
X-Google-Smtp-Source: AGHT+IFdRpQTjbCVEAc5nDVoTookmyFz0UYQ5bCgOGFgKVeZAWQ8RM/2i+LzJ8MkDBkj3RKJ8+7qOQ==
X-Received: by 2002:a17:907:6eac:b0:ad5:3156:2c06 with SMTP id a640c23a62f3a-adb36be2f5emr1647258866b.28.1748952242835;
        Tue, 03 Jun 2025 05:04:02 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb34881d45sm753497466b.128.2025.06.03.05.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 05:04:02 -0700 (PDT)
Message-ID: <a845370c-a1f0-4d02-9144-f199ca845d59@suse.com>
Date: Tue, 3 Jun 2025 15:04:00 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/20] x86/virt/seamldr: Abort updates if errors
 occurred midway
To: Chao Gao <chao.gao@intel.com>, linux-coco@lists.linux.dev,
 x86@kernel.org, kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, eddie.dong@intel.com,
 kirill.shutemov@intel.com, dave.hansen@intel.com, dan.j.williams@intel.com,
 kai.huang@intel.com, isaku.yamahata@intel.com, elena.reshetova@intel.com,
 rick.p.edgecombe@intel.com, Farrah Chen <farrah.chen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org
References: <20250523095322.88774-1-chao.gao@intel.com>
 <20250523095322.88774-12-chao.gao@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250523095322.88774-12-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/23/25 12:52, Chao Gao wrote:
> The update process is divided into multiple stages, each of which may
> encounter failures. However, the current state machine for updates proceeds
> to the next stage regardless of errors.
> 
> Continuing updates when errors occur midway is pointless.
> 
> Implement a mechanism that transitions directly to the final stage,
> effectively aborting the update and skipping all remaining stages when an
> error is detected.
> 
> This is in preparation for adding the first stage that may fail.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>   arch/x86/virt/vmx/tdx/seamldr.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index 01dc2b0bc4a5..9d0d37a92bfd 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -247,6 +247,7 @@ enum tdp_state {
>   static struct {
>   	enum tdp_state state;
>   	atomic_t thread_ack;
> +	atomic_t failed;
>   } tdp_data;
>   
>   static void set_state(enum tdp_state state)
> @@ -261,8 +262,16 @@ static void set_state(enum tdp_state state)
>   /* Last one to ack a state moves to the next state. */
>   static void ack_state(void)
>   {
> -	if (atomic_dec_and_test(&tdp_data.thread_ack))
> -		set_state(tdp_data.state + 1);
> +	if (atomic_dec_and_test(&tdp_data.thread_ack)) {
> +		/*
> +		 * If an error occurred, abort the update by skipping to
> +		 * the final state
> +		 */
> +		if (atomic_read(&tdp_data.failed))
> +			set_state(TDP_DONE);
> +		else
> +			set_state(tdp_data.state + 1);
> +	}
>   }
>   
>   /*
> @@ -285,6 +294,9 @@ static int do_seamldr_install_module(void *params)
>   			default:
>   				break;
>   			}
> +
> +			if (ret)
> +				atomic_inc(&tdp_data.failed);

Should there be some explicit ordering requirement between setting an 
error and reading it in ack_state by a different CPU?


  < snip>

