Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D94A277C8D
	for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262532; cv=none; b=mGYLW+jO+JxN0kR/yfAAK7PUK/0wELEpeHcqI9Zseo8S1A/lSZkdGYOgOJhz3Ts/HiZ4g/bsLbz0IQRYvQLaxOyxpwTENo3ufUkRaRan5pEnkAw+64MF0w2Mp4nAYGPhRUHPsNFCqrXVZ/54cad0Pj48z4Ch4scsvYgbn1aCo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262532; c=relaxed/simple;
	bh=IeJtPHg77YUC6PRv69OZcOoEvbzlzVHFg4enDQEEKAw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=I8PYZEAHpXBzmM1JqkKZwZnfoIC+xIqlQOa6thFhs8fU2mGfhxFuL5+Hu1dJwvcxTKVWtkcZvP7UsS9uSdq3LK/IsmIR07RT32TRMyNPT5AxgdrmYKtL+FKesgCEcW+8e5cTlqeJudif2ZPHZv2yjRx1v+VD8pxdGRkrNwZttM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=YZQb1psN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YZQb1psN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so7195535e9.2
        for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764262529; x=1764867329; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IeJtPHg77YUC6PRv69OZcOoEvbzlzVHFg4enDQEEKAw=;
        b=YZQb1psNprvYfKDbdCNJWDpq6WR4muH16V7pZWJXc6kgQzZ+UbByKH3CuvRdcCkou9
         Iu5L830WzJwjkmpRinprlCcMOsKloIvydEbksVyhATxNz9Up7q9dDrjLqar1iYsZtKfK
         HOi+NoAzXR0433URG9g/PYP0Q6xi163Nvr+Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262529; x=1764867329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeJtPHg77YUC6PRv69OZcOoEvbzlzVHFg4enDQEEKAw=;
        b=ptP7vCrfj4dNve48/gsEIAUxou7xUHjCHJ7lXx8zUXs6JnDvSeMEm2Jhlj2RTPiP8/
         OalfB4TuVC4il1wmm8MCAlIljZMaQ4bC4uPtDkU7Wn+t6IpGO//q9y4AN0k2Dxi0v8rz
         Q3wphW7RYFgCm+18uiIr2svrWCRqpRIebYxHqpz1D9ftTcJdH4P6OFD3oy/gAXYfxHFP
         VHIPIAtAd/FDwNAKOm0oxnoBaNBwqn8JidSrTrlKIBjTmvBzpU4WTaTju5z8YGuh2cP2
         /XBmro9j3wLATuJBYkYz1FM+135sYm9hP7ZAvitwpD7mSw2fDi2DJ1ODGZ1E4FTJtRSM
         A5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXPHajhXrW2baHCZCuLyEuLvBgK5+2D2fMOZJ9EQQt4EP4htGTP5SaWLKXFEG8aVJ0UeMr5ZNTEYUZx@lists.linux.dev
X-Gm-Message-State: AOJu0YwO1bHnXLdUJzJu4v3PZ3R8PhOHkGzOcfc2yLg7YIqBRQjJNXqj
	6Ssnlc0mmMf0grFmBnU9pVambCV9rjCtUUkpZCZbsY0I2Ufk3b4LalVNQx/3CasKR+E=
X-Gm-Gg: ASbGncscxUv6RlNbKWnkZfW/La7EylF7BpYOoKZZ6XLOQbc9rQNAF7ZLwjDm2HP9Toz
	+IjnOG30W/KShczeMvF8YHz94sH4cZUqTy5h7tiPOdrTsHe71FoXHTX8XmTyKabjMEkRA8zjZg8
	C5kyxM87QUdWLECJtK436fNBUGopWRHSpFUcDtOlKuVAuWyFO0sHRWsNquKEt97FbRxVb+G/jrv
	82Afxerns/vyIHaoYKFwkTK8SFN4D0WdcCpUqdrFYAh5jOAs0almql3asWCp1VhrD2SAnlLvOKJ
	WYSXBs5aqGl+Jaif9w0fb7Vm5qCSTOJq44KfWn+IboEmAcKdePncUgkCFlBjzShSdKT0p+DeDif
	HZ6aB9demjeKEhqKg1PsaSa5YZl0G/eiS4sxtCKJtF+xxfQ0fn37LvEzTZbMaYC2LXmIzUnUUwA
	kem4qrnTjX0v9xMXI917XOypqidrYQ3mqP1DRUs/h2eJGuPND2W+43
X-Google-Smtp-Source: AGHT+IFqLmk3E13nTcdaR5/YH8vHx+R6IrCKP0URG1h1SzYYVaO5JZAy86O9ETe+kCquQNS6YUPBjQ==
X-Received: by 2002:a05:600c:4ed3:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47904ad05bbmr111716425e9.8.1764262528611;
        Thu, 27 Nov 2025 08:55:28 -0800 (PST)
Received: from [192.168.1.37] (host-92-29-237-183.as13285.net. [92.29.237.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052def4bsm69390685e9.13.2025.11.27.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:55:28 -0800 (PST)
Message-ID: <4676722f-98a3-4217-a357-068440dc6e14@citrix.com>
Date: Thu, 27 Nov 2025 16:55:27 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kas@kernel.org
Cc: bp@alien8.de, chao.p.peng@intel.com, chenyi.qiang@intel.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com,
 reinette.chatre@intel.com, rick.p.edgecombe@intel.com, tglx@linutronix.de,
 x86@kernel.org, xiaoyao.li@intel.com,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f2hkqt5xtmej7cfnuytigcfszr3qja4l6ywww4qrqxjbqmlko2@r75b6deae2hd>
Subject: Re: [PATCH 1/2] x86/split_lock: Don't try to handle user split lock
 in TDX guest
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f2hkqt5xtmej7cfnuytigcfszr3qja4l6ywww4qrqxjbqmlko2@r75b6deae2hd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> I am not sure. Leaving it as produces produces false messages which is
> not good, but not critical.
>
> Maybe just clear X86_FEATURE_BUS_LOCK_DETECT and stop pretending we
> control split-lock behaviour from the guest?

(Having just played with this mess for another task) you're talking
about two different things.

Sapphire Rapids has an architectural BUS_LOCK_DETECT (trap semantics,
#DB or VMExit), and a model-specific BUS_LOCK_DISABLE.

It's BUS_LOCK_DISABLE which generates #AC, with fault semantics,
preventing forward progress.  It also means the Bus Lock didn't happen,
and there's nothing to trigger the BUS_LOCK_DETECT (trap) behaviour.

Given that TDX is enabling BUS_LOCK_DISABLE, it's probably also enabling
UC_LOCK_DISABLE (causes #GP) too.

Looking at the backtrace:

  x86/split lock detection: #AC: split_lock/1176 took a split_lock trap at address: 0x5630b30921f9
  unchecked MSR access error: WRMSR to 0x33 (tried to write 0x0000000000000000) at rIP: 0xffffffff812a061f (native_write_msr+0xf/0x30)


First, "took a split_lock trap" is wrong.  It's a fault, not a trap.

Second, because the attempt to disable BUS_LOCK_DISABLE was blocked,
simply retrying the instruction will generate a new #AC and livelock. 
Linux probably ought to raise SIGSEGV with userspace, for want of
anything better to do.

It looks like software in a TDX VM will simply have to accept that it
cannot cause a bus lock.

~Andrew
