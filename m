Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5614386D
	for <linux-coco@lists.linux.dev>; Mon,  6 Oct 2025 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759761714; cv=none; b=sJb0ezth1BTzjJU8INhN76u/ko7efZ9TFgAynfP8ymPQFjrN8N05LaE9GC5pHecL7AwpY1Ap+ekDKiJ3lWNQ+9hwC3CEOTMGnFxXW1fVXJ3kjk13ewC1GjcW9SxK6vXg8a/O0KYSPCMU3fiKqlCHR1X2OEvTMeHYUflLgG/1om0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759761714; c=relaxed/simple;
	bh=hibbnGnU3QECPZ6XnLJVURE4JHkyRFFdkx1txeFXrk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozP/PgV56MrJoZz+9HNdXWhtB7cEZ8YQDgFG+RmgcvcEBMnf/ppxOgS6M0Ui48kjuHD8GfZRcwzbMN7SXse1qfJ9suCqopvGd/ZtvkESuVmJqUJSV+50lae42wg4I0bqcTRaX/2/Vb38lTSlqozRHc5TKZsBs7UIXWK58xmxZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Z2AmWhaN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Z2AmWhaN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso4388817f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Oct 2025 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759761710; x=1760366510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hz+Rkixx7LLpkGutsP5m+f97XLiW/dBpijXGClCMzvg=;
        b=Z2AmWhaN4Hqj+EqlfO5zmMTxmAbZN4G73VLxaDadX0JoyL0g8PEoVXnhs9o9gMJ9F8
         U6k3KXvzVUqd7oXMoOBiq04kLnCS/PwGNV0y2gdgv2uUG6gq3cJzQVt1rSgXcrUr8OmA
         JSgydMc16YbjAxcIzPnP7KJnm9LxPtDE6hqL4oAC9PI2FXE21Q2KsxieMS91Ve6EeWFu
         txL99/dtIePfHfOOGdkHVLIP8tSxs94VjB/F3n3uEWgzlsV3Oq9av/Crti7ixggnd2x/
         aopoY0aLcngkkTKkqqDJypBw6bpbVsMhK5kmAC74nrEWIafsvgS9MM/GtkF0ZWtLVrBD
         9VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759761710; x=1760366510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz+Rkixx7LLpkGutsP5m+f97XLiW/dBpijXGClCMzvg=;
        b=CwVxF3TBord5ryLvoMXCDn+bcqtZ5xhZwegZ7+NZKWRyrsZvppGPzBIonxD96XQyDB
         IA1KhRxiHwMkI9xXOzu23ez8ppMsxLNwkClWYFzzeQfWWxUZrjmXAf3iMVKSBnuuv32w
         zcd8lc7Q16BHgN4paSn7Yql8ZwNuaMroWOSYD6CdjklvjBr5nAPVQFvMgw8xePTGfCQS
         MzZMVqfTj3sNP/xZtz0Mmi44EYryU+DoTPs2NaIO4I+iJoMW9P9WolVd23hOpLJjcDKd
         YVHGgxczQjnl3dpQbeZe1/3FUVq8Rj+tbjEnkIZ16RtsHaTCny6nmFa6B1R/6xrZKxo8
         uQ7Q==
X-Gm-Message-State: AOJu0Yz11Y7G0FH4SY81Yt/pohu08kPp1xqZLTStJHDZTGvJN1bhfBLc
	vqFn93//E07bzNwRPvEvfA8lhjXkUf5qzHMc/jTozLFeQLs2ns4xdkWKI2NiN/JkNU4=
X-Gm-Gg: ASbGncsngQf40zY3gUo4PMybGY2BZj6vccPoj2qBgkqedFER1eP0Cu6GM1MtFew9vtO
	Wc1xoPuYwTxe3Tt0wPkYC5JAUvM1aFjX121VGgsY+VdRcDZsZf0XEFZJkOSy/ZvYoewBQ9u20hm
	/hARtHCWDiacdU7P8unC7D7+y5USZKtPGiaoZIirZc2sd7bLqVagRvc0x3H7H0GtdZB71PMGop1
	5IhAfgmtT6DBhRpu1h3ljq3k7cx6MCooW/4dPG9ROfU5k0PWPa2X/YSpUOt++7ljVqE42T0YUWy
	Q1Egs4nAtnLbZJb5iuIG7Pr/i9+c0B0cb4doYCEpwNz4+xctlHxsSX7rqNXjimzKJLLuNGf/S7f
	jtiTU/RpmFIxyf17V4t0D+L/LghylxIEbrQmuzj2pa/qn
X-Google-Smtp-Source: AGHT+IGp2kpGC3tLU0TDUDe5UOS8YTL+TFbJB6Ca2hXCgzJwI7mQpc3V7iorKqz3mSJ5Vw/OVFNcaA==
X-Received: by 2002:a05:6000:2dc3:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-425671ab145mr8349496f8f.43.1759761709818;
        Mon, 06 Oct 2025 07:41:49 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:8190:7100:5984:e25b:cf23:2e9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f0846sm21385065f8f.45.2025.10.06.07.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 07:41:48 -0700 (PDT)
Date: Mon, 6 Oct 2025 16:41:46 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, xin@zytor.com,
	chao.gao@intel.com, Dave Jiang <dave.jiang@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 09/27] ACPICA: Add KEYP table definitions
Message-ID: <aOPVKpkZK9nFOo49@vermeer>
References: <20250919142237.418648-1-dan.j.williams@intel.com>
 <20250919142237.418648-10-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919142237.418648-10-dan.j.williams@intel.com>

Hi Dan, Dave,

On Fri, Sep 19, 2025 at 07:22:18AM -0700, Dan Williams wrote:
> From: Dave Jiang <dave.jiang@intel.com>
> 
> Add KEYP ACPI table definition defined by [1].
> 
> Software uses this table to discover the base address of the Key
> Configuration Unit (KCU) register block associated with each IDE capable
> host bridge. TDX host only gets the max IDE streams supported from KCU,
> it doesn't access other parts since host won't directly touch the host
> side IDE configuration, TDX Module does.

Can you share more about how the TDX Module knows about where the KCU
register block is? Is the host VMM supposed to explicitly "donate" that
MMIO region to the TSM before TDH_IDE_STREAM_KM?

I'm asking that question to potentially align the RISC-V TEE-IO spec [1]
with a similar KEYP based implementation, as I think it is simpler.

Cheers,
Samuel.

[1] https://github.com/riscv-non-isa/riscv-ap-tee-io/blob/main/src/07-theory_operations.adoc#root-of-trust-spdm-session
