Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAB4D5B4
	for <linux-coco@lists.linux.dev>; Mon, 29 Jan 2024 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706512939; cv=none; b=GR5HAZJK70zr9T45KWBeHZdgEEPUwlF/z9ZLYH+78PH1vJb1wdRsfxcIavgPjVFOcF5PL9UdDrW6RM8ErN5i2k3N2r6x3ayTpCPxk+FfD/duJwX65dnbZRj6kwkAfXKibb7cYN2C16J81ujCbzymIVNBjnZUMXxS7AUiG2JcRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706512939; c=relaxed/simple;
	bh=pOeBpfnIGTyAcSL/FQR58BXAk2dTUWrcGwza6diBqqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQNjhAnOKwocNjswlbP2ObyLJ81e0aME/eKgmBgKSytyRYR+c3eSk7QR5xnBPcc3Lzn2U2n0sAvav5LgTvM79ms3OEy9GBLLbU+RmGEnxvO/Z0coOBGugg23hL9/UeQVgQq8Ro4QI5/VqXyhMt+BnzpjoR7w/e8LlNgaVHK8LTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QoExxfRc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QoExxfRc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so33400905e9.1
        for <linux-coco@lists.linux.dev>; Sun, 28 Jan 2024 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706512936; x=1707117736; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrgnZOGulcP9tuVmCHC1ajU+ERsd9Badipl3nQjKaNo=;
        b=QoExxfRcMc8o8VPQJ9Emsn+eALTXTVVAf3KP4IadlU7lvtYOumM/ybS0SUEOIKrn8E
         xY5zPDLPqEqR+j+B/TMhQ+GG1KDmcqYoFnxdK5tHoGp1H2BjAc431Zge89wZHM53XLjl
         nYQ/YAItjfIlQ0nNhAsvvrg9TZmcOGI47ZflGKYKB7RN4deU/tSfhgJ1ZCYBbjlTgSc7
         f5r71/tbEe2IWI3Poe5tj0aLYztO4bLXD/hamMdffplQ+vJgQ+veq7xXnzMUdDI5etmp
         7JTBwBEVFTFUBdSCIRi4SVkmP9CSOlN7eH6HeSTV/BMCSUNFN4N9vAEHJsoCc6Ug6qX1
         4e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706512936; x=1707117736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LrgnZOGulcP9tuVmCHC1ajU+ERsd9Badipl3nQjKaNo=;
        b=DAyYksPeKswUyR6zEog95k3ZAkBffbTB7kdnc1wtvTDXP5WT2DMuRZjfM7pCU4oe2P
         F5n9rlBbwNZSdLbpzV3yZsJkKAMtm6EzExhWwd+B4BQqmSnfwvVZ41A6UsR68VDgeFyB
         73DUywmB070HhwttAU5nXgx+u1RNj2va660dmhfqej440u3MDSGPRNAJEXQ1Dn2kzvLP
         Uk4KAaisjGlcaiK8rppzml3qwwovR0HjjOtiM6OyYTsNxMyJ58MtQd64Up/77iUu2+89
         Mvo+kb9Pw4ckLdlii8yILkKdDNz4bColovVZfssox/URuQma/kgjNbTgJc37VPHJBB3u
         iMhA==
X-Gm-Message-State: AOJu0YzsaW8ZrYbqgT2OWvvhssyGxbC+XMfjT4c8Q+7t9FiSDQUfcDUF
	GNPxRTfhOq1udp2tHcMcYy8blGEf+Zl9tbqsBbkDbS4jRky6IjnecGsN6qZb5Os=
X-Google-Smtp-Source: AGHT+IHZDgIWhUn6PpGqUdNjpy0qgdACWGR/C6o14VWBOR70fiJGdJK2I9E3loxNce3mWT4UwH+kIg==
X-Received: by 2002:a05:600c:4f50:b0:40e:93b4:25ef with SMTP id m16-20020a05600c4f5000b0040e93b425efmr5101615wmq.26.1706512935752;
        Sun, 28 Jan 2024 23:22:15 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:cd6b:e8a3:8a4d:4601? ([2a10:bac0:b000:7588:cd6b:e8a3:8a4d:4601])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d69d2000000b003393457afc2sm7224289wrw.95.2024.01.28.23.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 23:22:15 -0800 (PST)
Message-ID: <fed13d3d-c87c-4e5c-9451-779200c35a1c@suse.com>
Date: Mon, 29 Jan 2024 09:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 09/16] x86/mm: Adding callbacks to prepare encrypted
 memory for kexec
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240124125557.493675-1-kirill.shutemov@linux.intel.com>
 <20240124125557.493675-10-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240124125557.493675-10-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.01.24 г. 14:55 ч., Kirill A. Shutemov wrote:
> AMD SEV and Intel TDX guests allocate shared buffers for performing I/O.
> This is done by allocating pages normally from the buddy allocator and
> then converting them to shared using set_memory_decrypted().
> 
> On kexec, the second kernel is unaware of which memory has been
> converted in this manner. It only sees E820_TYPE_RAM. Accessing shared
> memory as private is fatal.
> 
> Therefore, the memory state must be reset to its original state before
> starting the new kernel with kexec.
> 
> The process of converting shared memory back to private occurs in two
> steps:
> 
> - enc_kexec_stop_conversion() stops new conversions.
> 
> - enc_kexec_unshare_mem() unshares all existing shared memory, reverting
>    it back to private.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
