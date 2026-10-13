Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0451CF7A
	for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902066; cv=none; b=RJe6MV/gUyn49up0v66RmsuHMpyFclKi3+ctEO+/hvwCyZYd7K3virE5VOpagEAf5H5Z+VjkoCTPfREWrE/4FZp3KMv+7GggbNu8phhZ7MYY8kq3u0QoJhbhtNNleBI1PsfmSdJ7VXJc3Fnu+Lma7tJy+ColGkmF7i7mLNNjO3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902066; c=relaxed/simple;
	bh=epQdanmIbBSQQyUyr4wJmA1U07a04RykgIxTcxuNy0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOXnefJPLDZ4A0z9gFy0MGu2UfU2APB/D3E3Nh4eCQPvn3IaqtBViM8VfJ5LGVWowHHapMehZBRoUBJaiCogediqSO1mT9yniORHJNhMZg2xAuoRcInQxbxdGygC+JU3frwOU1eIATNdlvvQUhDmVoLapyYkYxfzTe4wHr8zRsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aNysHwlt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aNysHwlt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so28503635e9.1
        for <linux-coco@lists.linux.dev>; Tue, 13 Oct 2026 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791902063; x=1792506863; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wXreF/I8cRdQC4jDdNM5mdo3jIec5dd48MtOjybNLvg=;
        b=aNysHwltWWrm369B0uafyXD4Yq+urOrn3LKXJy7gzyzwELngZwtF+F+M7FnHE+n3Ce
         QHl3ccQjjoojjj5nB+dLqJy6WctaZY52r0oKs6zqc+9/QPjuRvGMJ9b2SfaS01GPYlF9
         JAgDBxXUPOsVbo2yW0g6wPDd2rk3Z/KYJJb1N8nnvU3XEfOSpXRk6dsGb1WNVSdIyBEH
         kk0+dRX34JJPFGTunE5uHQmwpe+HoZK76LCG7lJ3Xc2eD4o3ktiJQrz229TMfMymqV7L
         NUGLF5vQNvXXdwlNyvBX83R/uM9B2nTp1Z8JHogSAFTbSvyPv5sgrq+h6agEFSafk9r0
         gFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902063; x=1792506863;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wXreF/I8cRdQC4jDdNM5mdo3jIec5dd48MtOjybNLvg=;
        b=VlfL42se8o/fLxX2eNceDDRvZzLAdQDEvVjSdMkenKqHjQDLL+97CocAh5dGxkisfL
         FvET3qlPp6a/rNO7hjWDrZE9mM1k+3VsyISeXCYPeKhoUsi4m1dhMiwunxJftBUjhkTN
         pRw/LZyxIapGp3mpTgeRa42Lbu64lfFKEtnNS1aN90D62yiUYf7IBLO/Wis7x+ZC5AfB
         TwQG/cmAxupZz7Te8AIsllyzINQb4HkkmAYBHwWQoBG3XhijRCylOMR/I5ay2xgAUunk
         KOtBKD/dwLpNBX45bRz5ffmi2/nGqH2VtxbmOYezKlINM4BbXCGxP3RdzyVIJYX1/Lwy
         Mz/w==
X-Forwarded-Encrypted: i=1; AKwUvBwLPZypoPBQ9K7HRoBL8oz6OA7XC1KSkEiGoPU/GYOMhoOcBNAf0SRH6YUBPKcu7eb1juWZkGcKHpsT@lists.linux.dev
X-Gm-Message-State: AFq9FYK3UHjIbj117wVgtOKN3HYaOylrXnGxAhLNHGHl2eqr4PYGNZut
	sa636pliT8viyLBPzsU/rRjsiF0RUh2TXfLxhSmjjwvP8cs6k+PRuN0lZCPgvu+O60s=
X-Gm-Gg: AYBFou0QggYER07dmtK2bP1vHCLIL13tYeAKKKa0CZBjpDGwcJnEYV1Kdov6PIXAfWV
	3S8XTH3+smlQgX5V+4TZQvEzNbX4mAfaFk76j8eRSbt3PZ9AwZVhodNOXY9ttqXJERTTGFLfIHX
	U2a2wHlQxY+GDcrcnTD7yucCXMHqXDZ6eN+TXCr8TIPICunWVvS+pyZG2FfmNUjNr5KqJLUELMT
	cV0kCSen1LS3eOUsLHaNoRvqG9UeExTOwGu99bKWj+Ax6Ymcy75pNl8Fu7Mc9Cc83RbS/XgFEdn
	Lds+mefznThe4KigL+CC5/4zFBBlT6b0L4LA8s6vpe7tX4mNfhTl4GF6bNDnBvRvP42QjU3nTy1
	Y2ethASGXyPrN6zFpoSq+5XnAOsk1NUhV6ty+WwPg/bVOhyjoA85E99xo0IKXgIMczcNfWAPg2G
	OGe0lk12lwW9L21mpH+BP91sziTVLwPmFM5TEy6n+Z+5qVDdBvMS0rR+cx4wiK9L42ki96OMyw4
	S2BOU7Qu2TE6Q5xVFEoVhzD
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr250131675e9.3.1791902061229;
        Tue, 13 Oct 2026 07:34:21 -0700 (PDT)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [185.218.66.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm519463945e9.0.2026.10.13.07.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:34:19 -0700 (PDT)
Message-ID: <54846068-d545-4591-b850-2980ce57f40e@suse.com>
Date: Tue, 13 Oct 2026 17:34:16 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
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
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260924041032.1096569-3-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.09.26 г. 7:10 ч., Zhenzhong Duan wrote:
> TDX Connect is a TDX feature that enables secure device assignment,
> allowing a TDX guest to directly interact with TEE-IO capable devices.
> 
> The TEE-IO Device Control and Management (TDCM) hypercall
> (TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
> primary interface through which a TDX guest issues device management
> commands to the host. The host processes these commands and returns
> responses via a shared memory buffer.

This patch contradicts what's going in patch 5. Because you make it 
sound as if TDCM is yet another leaf of VP.VMCALL, but then in patch 5 
you introduce the polling code to read the result. And there is not 
enough information in the changelogs to understand why this added 
complexity is needed. Isn't TDCM handled synchronously by the VMM as the 
rest of the tdcalls, is it perhaps handled by TDX NRX module?

> 
> Abstract the underlying leaf call and pass the shared buffer physical
> address as a decrypted mapping. Add a runtime page alignment check
> for the buffer to enforce correct usage.

<snip>
