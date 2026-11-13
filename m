Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586384;
	b=fMfY6DiyNABamFSCUU9Wup+1E04FMLDkj1XyOQTzHFzAsO6GtmllyUEDaJWxRhwq+fRV
	 Db5/bK1gdxxMDrnkvwdJ2GrEm/BuVd4oQSH6lt5vi+KjCSlcK/uFRcj8XvZoyWAb2ftx3
	 2uwT/VFtJ2jZ4TB5miQNlnngLl5Pqtf1RfW+vRtwFpbDlRHhvrowvnelU5K5+QmhnnwDv
	 z8JrE0O50XTu/DVCmEKA4OWbQOTFlc1ACfGjM4YNlkj9On33hPd+Zlp9stG+cbliiDDHM
	 LQte3oJUpnzI6UpWoc5LdlNXObGfjKXpv8IhQxRWO7FkluxlZTCtgvWSar/SS3WzpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
	b=omvPZPw/DwciW/tmp53OwpaMK8RxqGYR6ANTqjEJKgDSCNndV44fzvMIVOr2VP+XImPr
	 v7zSx1Vl0XZlZrs408ToN92zVvRpp0OAUnFAE8uqW/PPyg8WzzRekwFxqMw2hQP9Zve72
	 64jNi2L78bCd8KbUZ0WqYojBFMgQ/r16FCWQbkM6JmHCMRl78r5Qxkn9qXhbA5WSXjdNK
	 R/oVWVvg3aNkvV2RJrabV7JbIXcbgUs6oJZOGfbno+onnwL7k86KktPdFXQJFX8Tm1sFq
	 e8h36PRXVw8cKW+ihlRco7Z8hGnbylGHzSxM6PEvzxR6qIAxNN6MTbswOAwEc8oN3xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJrYOGFk;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABA606C571
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 16:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3ABA606C571
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gJrYOGFk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so1665104f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794586382; x=1795191182; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
        b=gJrYOGFkloeThclTo04A2d7Jz5aqiuqV88P6Y4EUslaUOTxawsEwLWLno2A2XshTGM
         PzpH6NR7mVVJY2Ws7Z/uvKvK3WKkAUgp+huj80giai46q4pfU/Xjz1fsQ5aubrtITEq1
         zwfOjA8rl5OlU4nMurmwZHNY0ZF+GDVzQjnm0R81+yEc1UK/YvXcMyP9zjuTw7bIoPnN
         Ye54uAvmZqUlTkN/xUE08syaWD2Q6c6XMb3v7jz3WH2KOnmSWYpZFpz+RHxTCrKePPaE
         ObYPjGImgTK+vK4xPwfEz+5vd1SWrdFyObHz3uhXU5cHwltIS5UztogpuWHUaDnOy2KD
         efww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586382; x=1795191182;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBhj5ZT/wKvt1cB2ZHQUyu1GVRILA+V8UDZgyKlKW6A=;
        b=OK8+su63KxhMGx3Sqa66mi/NnQ88XD2gUvygM7rIBstAqZV4WTEeFBrGLlSd/4DgLE
         GhjUAnKftE+v8fkCqB7vG3ZbietWDFNWI9uL1W2ZKsxVDxIQwB9nwRuCe65gDATvego8
         s5BZVbKWzDyrry++KFLURPc4JWGqURo5DFZzoRbNXcAq2dW0tytG+I2tsrB39hMRaIDZ
         Av1XFdRiNaBmjhuY6Mo4Op3EvjLaZGEZ6GOxT8TAwizccX2ZNeiZbkWiFZPt37r5RIe/
         jhLpJcMnYJw5W9J9aXySCJ8wAal2H5RpJ/ONLaJrHwhaATIRGeksJdA08RLkj+okmXar
         aRTA==
X-Forwarded-Encrypted: i=1; AL+hErG2syIoOnB3uBjEePZiGRrYrrcMxGtQDaaFGfZdaf5R+mCfTkqZhMYlnnYBldIXtG0OAGdfo6FL/naZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/bQ3CGi5peYleLVVYeD0rK9tsIRu6YSMCnswxovh0mH24vtIRa
	6GCWjRQBMF/SHibbNsNUJfz3iKlEKTAjaAl1oxKc1tV/No7gE+vwin+VP9Wq2mDs6CU=
X-Gm-Gg: AYBFou3mXzhA941WWayP+HLKgFwUgI9TZc4iG4pdDZlDCPJTvm8rTrPF5oSGhmDRkV7
	gclQ2kZ0hrYp2kYoC5Xuxu6UVIqNf1AbqkwH+JBel6DqCkTCOG14ZvxHRGF0AXwoeG3hkVn8X6g
	zwBOF1Q8eGI46dzoQ32SSLO5AP9LAPwxf44eCWeZohQsCiN8t+dMVVr2YeUlW+ablKPHXb2lWoZ
	DbTIz4gU5/MSXbG5G+rhBJ+JjRy/zO5L5F0r2CmD/3sFkYW4+vSBPRLUzDb50Njs0bBjdRjP9mg
	NTuB7jnWC3XHRsyg5dY5ERDKcfF1Nrrmh6RwUe2Of2Qh4EnrvSx//fedl0f+RCcx5aT4kyw4dpw
	ZoquJ40JBQaMRcsaP9K+YztGWUe13TUZLfW1k/x8I/+q+QLzIkne4T6Co8W1BITDBmLdrFvWRKc
	Jp3dHig3ymj+PvlZvW2i6GpO58tdaQ6g+q9Haa4ZD8UCZxLw8Z6ArNGlq+WeGR6+Z5r5c8I6w3m
	o9To1v4Y6V10eiD0QWOwaw1y+sHFry0drFYyJECca22WIpVbYJaWw57b1i1gJdgBqIRnH1dHf8V
	Yf9keouhKjchIrbKGDFIs6Ag9xhI5MZB
X-Received: by 2002:a05:6000:480e:b0:493:f3f2:2255 with SMTP id ffacd0b85a97d-49c70542714mr6244595f8f.25.1794586382025;
        Fri, 13 Nov 2026 08:13:02 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm5658167f8f.41.2026.11.13.08.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:13:01 -0800 (PST)
Message-ID: <8826c56d-8fa2-407d-8362-3edd8c281cd9@suse.com>
Date: Fri, 13 Nov 2026 18:13:00 +0200
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] x86/virt/tdx: Make TDX module initialize the
 extensions
To: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dave.hansen@intel.com,
 kvm@vger.kernel.org, yilun.xu@intel.com, xiaoyao.li@intel.com,
 sohil.mehta@intel.com, adrian.hunter@intel.com, kishen.maloor@intel.com,
 tony.lindgren@linux.intel.com, peter.fang@intel.com,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, chao.gao@intel.com,
 artem.bityutskiy@linux.intel.com
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11.11.26 г. 5:48 ч., Xu Yilun wrote:
> Continue fleshing out the extension initialization process. At this
> point the kernel has provided all memory and the TDX module is ready to
> initialize the extensions on the memory.
> 
> Initialize TDX module extensions via TDH.EXT.INIT. This process takes on
> the order of 100's of milliseconds, during which the TDX module loads
> its internal extension image into this memory and builds the execution
> environment. Once initialized, those add-on features can use their
> SEAMCALL leafs normally.
> 
> Note that TDH.EXT.INIT builds all configured extensions. The SEAMCALL
> leaf fails if any extension fails to initialize. The kernel does simple
> error handling - just fails the whole TDX initialization on any error.
> This is OK cause all extensions are considered necessary for security.
> If a nice-to-have extension appears in the future, this can be
> revisited. A potential solution is to have a new metadata field
> indicating which extensions get enabled/failed, then the kernel decides
> whether to continue or abort.
> 
> The original changelog was written by hand. AI was used to help correct
> grammatical errors and polish individual sentences for better
> readability.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
