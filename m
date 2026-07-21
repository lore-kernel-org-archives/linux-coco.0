Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B546AA81
	for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647950; cv=none; b=Exc4MQHOI34u3/LxO3lYum22MgJQ6WXjhyTDEaIUMN2qUAFLk3tt10Z1SwA77OLEqjaEcbpXMSml7FDxFn8xq0/iXgh3LsjIkJDtZyYwjJNQzqhHm2gM2QkbBaha20MlGRvq/HG/7pHy2f0BAjS3SO1X9A9uGSfux1kpPddaYf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647950; c=relaxed/simple;
	bh=fnGcqlp+PIpDwV5UTCN1K4XItWzBa2mzQPtdzrj7IIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aI9hL+ASnGMGj/axwxza0RiVYeuqRmCqI86YfjpXCVXfWQNOEbbjfASyffq4qEZUyWjQIjqB4ozhDDe05gb4tdRXf7+T1jjqn/tAkUXItWuJib5NhdDQ7eyMq/VKWgeyODp1xfW1p7Q+NI7ScacRE/8TnrK3JRTrC/XD57dT7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eloTBTHu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eloTBTHu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2859342f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784647946; x=1785252746; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2DC9XvB+0REkpBk4lVoyAb+GKqX4RxR1iS8G5MlGtxM=;
        b=eloTBTHuuyHb5YtyR2git+/Biim0GG0bO9s8gcWH+WPFRuO4xhZ+mks/228kYEqGuL
         5RvdAh+BA9pHSl9Eh+Ajp3nkoBJZvpnfjz/tRKdQJElGjqorpm/0vVg1luLxs8n3ojJt
         l5fGa4/KFzWueDfJeQUxVXvtE9KWAEidq3muzrpLagwd3h9iLAgCAn9sUo9OHGI+HdGn
         OT/te8gBppoczTfVhKKuUly40enQCiV0k3WM60rupngtBLJKUY0tjsdohUjuL/SgNKhx
         tokAEnQCpaakfGFiN9w16qAFEmWTjSoE1TnFRhXP/Gk77egUjnVC+fVwSBa/RXRCOoDk
         FOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647946; x=1785252746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DC9XvB+0REkpBk4lVoyAb+GKqX4RxR1iS8G5MlGtxM=;
        b=pgch7/NV5qqi7IrvXI9eKCcuY3ObZNRlNP2E1SMA5OuCF/UEL98iYy7l0f9odyhHI6
         lcXs75Mb5DKOGtPcZUtEDSWHGEzlcg5D0RjeZ9JaG4cge9H7gYULsrj7HUXRDNWPBwJH
         Obi67KwXwpFvBODHTaLKW0lVaOengi67R1XpNy/JLvRz3sDJTmhAEiX5Rd0SuLP+ud+n
         QY60HWlK7R8Fn2im9qdCq9A452fZC2e5IBSUKfZVGhFexYdAyJmDW/+idCwxoLVwLa9m
         4KYg0EB0UWcbdZ0tnJdtrKd9hU/1btTfnewgGvtvlvfjJOjG1ByTkP1Ygava6t00Y1lX
         mP3A==
X-Forwarded-Encrypted: i=1; AHgh+Rpxtgu7Ymssze3wZG7sS6fRrKSXfKMTJtgt3b3bpd0M058TrZzNGzQzcG1ziyyDuPsa0OMbe48lQUf8@lists.linux.dev
X-Gm-Message-State: AOJu0YweFB/b195OjiKCI5zJk9MMiVPoxeEPJCp8ypDCyua6lIZEgU60
	Ykv5/LOi8VmBN1oglqw0kIT5mDEN/fGQ4MnKptrjH+KB7XlvtvyarNkEAIjg75vgSSQ=
X-Gm-Gg: AR+sD10AVqyEyoA5+82Ia8NZE543n8flhiOoA1nGHpyrVQ2bBqwJ+cj/KlTt3FrLPod
	SvgM+AZ6Pk7wRcV8KW3mTt6X7sd8BVeSZAeK7DS0UamGiVaIP8Oy7SvGFpBsvihQaCX0ixG36vK
	QWjZOv6wGs+sX2YiVL+19xL48brANszAcOgAn1/hZH70+yZ8VF7y6muEQJTlQaimAeDF+PcOScY
	j+3wvjlwbMOIAtPaMXXy/aTfVpkYaAswwKkA7IUiv3wFN0tC7Q+kuUbzPhVylOL69u4a1HKYzWv
	x5dB4/r0MzFFi34hdEUM1eCyWJh3PSdsCMYZBE6CAPMQFZdwJ1+9hjvnDVQWMwi4M5jkxBgwSm4
	R+4m6+SLtOri8RsEqSctfSO/hxlWC2QWTvIgaHka7Gcea0uJy7oCUTWyftBw7MvkDgycinhdStw
	IMaIzL
X-Received: by 2002:a05:6000:985:b0:47d:f508:3364 with SMTP id ffacd0b85a97d-47f840c9494mr147362f8f.15.1784647945778;
        Tue, 21 Jul 2026 08:32:25 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.206.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e52aa4sm40851079f8f.10.2026.07.21.08.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:32:25 -0700 (PDT)
Message-ID: <615f6cad-99c6-4872-adf8-f7b45a660cc7@suse.com>
Date: Tue, 21 Jul 2026 18:32:22 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] x86/virt/tdx: Handle multiple callers in
 tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, bp@alien8.de,
 dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org,
 chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com,
 tony.lindgren@linux.intel.com, binbin.wu@intel.com
Cc: Binbin Wu <binbin.wu@linux.intel.com>
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com>
 <20260718014500.2231262-6-rick.p.edgecombe@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260718014500.2231262-6-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/18/26 04:44, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> tdx_pamt_get()/tdx_pamt_put() unconditionally add or remove Dynamic PAMT
> backing for the 2MB region covering the passed page. However, multiple
> callers can add or remove 4KB pages that fall within the same 2MB region
> and in that scenario only a single PAMT entry is required.
> 
> Make the helpers handle only adding/removing Dynamic PAMT backing when
> required, by refcounting each 2MB range. Gate the actual Dynamic PAMT add
> and remove on refcount transitions (0->1 and 1->0). Serialize the refcount
> check and SEAMCALL with a global spinlock so the read-decide-act sequence
> is atomic. This also avoids TDX module BUSY errors, as the Dynamic PAMT add
> and remove SEAMCALLs take internal TDX module locks for the 2MB ranges of
> the specified PFN and the PAMT page pair PFNs. So simultaneous attempts on
> the same 2MB ranges of the PFNs would otherwise encounter an error, which
> would not be handleable in the put case.
> 
> The lock is global and heavyweight. Use simple conditional logic to keep
> correctness obvious. This will be optimized in a later change.
> 
> The pamt_refcounts[] are atomic_t's. They do not strictly need to be
> because all access is protected by pamt_lock. The overhead of an atomic_t
> in this situation is minuscule compared to the global lock. Leave the
> atomic_t in place to enable future optimization with minimal churn.
> 
> AI was used under supervision to collect/apply feedback, split patches,
> review code and workshop logs.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
