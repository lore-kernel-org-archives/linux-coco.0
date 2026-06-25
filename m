Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F391FBEA8
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 00:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346774; cv=pass; b=CbOuZ+0w8R8AIRn4o/p6aeDkBWM7dRD1cIR5R/GAp5DXLX3tV5myVRa7YDMWxHcd7ycTavIVTvBCWSikYDafc8pW0WXcPT78CAwDwtW+Gulvms7relI4I3EJOKuYZjKEE3kIbPIKG2O8WM06mnTZCCo7knBiAyiYqeeBfnpiLcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346774; c=relaxed/simple;
	bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L32lPJCOecamtofPQmL38aOzoXaQhTkhewV31vKahL1QK2nYhv44IrfMDmMlzmYGQtAwilRVZqB3X4xKJ3kfk8dtCFQjsZGgVmdIPC8pcLcLEmkrlwZpdEO3oKbbnLcH5bSp1NW/4HJ4kHl7dFVzLtP2vj08ap+2qwPsVU9xbMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tG5ISBA3; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tG5ISBA3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139a71baa35so4345404c88.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 17:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346772; cv=none;
        d=google.com; s=arc-20260327;
        b=BnGKoi6om6noeYXS9BCF01QEhu4OzGaCiWgCjyBZMr0Ub+ilBYESDMFoL5QRUTKLlc
         /ufqnF0dR7BtcXoLZWvclWHgH6Lf4PBNTLS2cz6BRpJEZ8uLeThdMbfuKVorP2lv1yOo
         3BIwrmkOXHp4/EXXBINLalxp3Tdc7HT9SMr4Pd3CrpTGT/Hswa29I2C8ZiJqNnrD5sHG
         rh/1QOJJco4gyZShrpIGwRHxNDlVNaoAPOXLStmhTnW3aUYz0Z3yz99aXDFi4BLfMnRt
         GYNbplEEeg82uR8h80Fd6hS0xJy47kflYjdXPRcIMvgB+fxyOh/GAmotOBMsEAneM8NO
         40Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        fh=+A7bFHdkBrAnr50IKgBajgozPRk+fzMDeEUkh9X1hHU=;
        b=q3jjwhhTc/GMcN0vGKfkmiD2o5SMfExOsBjySmScZ7n6IP2DoEPL9IVzXaw/VINsl2
         vhLK1rcDxZ/LzM5Uc1tuDxEktnuC5cekqHSXFGA2gZYlwPdiJ4XO6BXFtaxVYSd4RYjk
         /mk3MFcyyN0B0RXRgiIuVYmdA4Sxid4oJcV5wX4YCPMgvRmzkzq7ON4DQ5LThExAq6tn
         PRXovTC5uMpvTmmSrE5gDTJDhCZkOVVG5sC9CZyvYp0Wg/KNKwhhhWupBkT3nfFzSWlg
         rTbWRLR7oOuOpAGme122nZ0x9gcZ2XYkcla+koUdv2cJoOPgWg6fXe/1HwKImhMelGFd
         8jJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346772; x=1782951572; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=tG5ISBA39t1NuAHza3yI7L5BZati1TMYqn5R0j9NuWxEhqogqOd0QbU83f/9Dc5/n5
         lXtxit8vTucIyWOWqCCpOOpPHVRSLAq2s4PtF/2VdSwGlEnSx0FJi8UNXEVC+21KPLA3
         tcRDnkivmjiz2ZQR12oU2ahBIoafJm6d/3zx7JrEnVx25Vusj1FbGB0dE7J8iUtCEhph
         wgwCEATxv9WG6yC7fAqg3UBLcCnlOTClqboSob14vTuYeflGrP8G62EiYmI6PknIZpqO
         0nnbNzGY9JSmYSJ/JmYTawv0e5EMohRRJ+YlELYDvwGbECL89EXH9BjKHAtMgLStXR5H
         p98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346772; x=1782951572;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=gMp67tqDpcIBpSflv+XCEmv0pJxx4+UlDMSojQi9AMX6yx0y6auhqvMjhIQtQHOmlf
         XB9EY8KlQ7lrz1xuFtLTxFTC+Z7nhCMz+3+szqIDslOQGlf5+MaOOiIN84dYGXqgF/ml
         yV9NTLSlyCgbikLPh3hYMHUDcx+XkYpyGZmHbAkUBThGtIt5H2hu1REGQRsLuX/bEPUm
         SVGHVeNJlXS6UwhFaHb9Quup3YRS1QWQBLOSz0YRUpiXU7V+8nAxOLWgspC3cCMSttRg
         wINjrabo83l6BJnXDR8klgMQOVzDCJU9XcR1ahnGwjHekYS0dqNbEXWVjFDTEONuMCPr
         ARdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8aiCr7OQT3SRJH3yifxl+RlIqGX2JqtouU2G1Z2AeWknHBLIOBlZuWPLIsnI+lrhMweKKuNW9nlX6@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfht+Fg37zq/C8As/RP7Kl0RiuNBMUdI15iXFLyAXBRRkXCFJx
	P6WiBAG4YPoYGioy5H0/oI8zqbH9bZPXG8eJog7w5WILpJZHQNOQl97LhJux3P2gGcbf6e4WXsG
	PMv7qeIUMsdv2KJmmRAeJEpH0Txt0AOw5KwF6Z6EF
X-Gm-Gg: AfdE7cln6+SGs42XzT5ZCy0CnfkH8ovpo4mJ7ymxYuDnPAKkq2PLI2EaI2H/nbYJntC
	JT1oXKdGJfT19yVRzYtZhM5sS0pgnDl22feFqpkF/0yrgtEORq80+FZk6LjW+NJfOKwDrogmaQX
	J29qfI6/ukfuZMpsac/X+ybUR9Qb3fQXMBeaCQoS1wl4nrW9JCue4F1GdSbydP6LVEm676GP5KC
	TgYoPA1gaE3vsDjbccLrXwXZIOWX4ZcvFvuQMcedaNYRcYcePOgm+cG4NTAonIoCY9UsBngQ8iT
	rsWMURoBG97m0pIKU0xIsWGDMv2TaPUjHYCbJp0jRA+ZLYpWwnb3wlqaRlA=
X-Received: by 2002:a05:7022:fd05:b0:12a:b39a:339f with SMTP id
 a92af1059eb24-139dbab1be2mr235748c88.21.1782346771178; Wed, 24 Jun 2026
 17:19:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:29 -0700
X-Gm-Features: AVVi8CeipeAcfAxYa6j2yQPCcdB9pyHrAKYmhFznoyz3FS_QiklRPL3N5ubFoHk
Message-ID: <CAEvNRgFUru5GEM7g6Z7nuaqQK2iFmW3w2dPYEKPuehkdGvP2yg@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: "Garg, Shivank" <shivankg@amd.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Garg, Shivank" <shivankg@amd.com> writes:

>
> [...snip...]
>
>
> Hi,
>
> Thanks for this series.
>
> [...snip...]
>
>
> Tested-by: Shivank Garg <shivankg@amd.com>

Thanks for testing!

>
> Best regards,
> Shivank
