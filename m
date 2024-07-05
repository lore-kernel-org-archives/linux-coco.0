Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2A14F102
	for <linux-coco@lists.linux.dev>; Fri,  5 Jul 2024 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720195469; cv=none; b=Tdey2VT3c2xH2tU3z9IF+TCwJWwJIak1qIfibjc6CI7SqUj7jH8skiGlCgybyz+C7/rMX3V4Knarj6nxTazka6UtH5DEmQ0clbmRVKWYahMSbGySww7GsxDDwQIFN6KMfExCUk/iTcz/Ehp7k+gl3maa4ZHe4Txp3ZOxULvZHEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720195469; c=relaxed/simple;
	bh=FNTBsX+63uIgnWKLXkG5pwYCpWKOxAZZwqQ8X2x73vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcM0RIFzRx7L9zpR3yimlJ2EfKOuxg09EYyjuxMLP36dpQ4KItL2B/smGhmpuoLSDneFm53DtbmhnSiyAnzfHZ2IDbw6to8SJmgpIFOBmrwc0gRFzRc5QB3G8o53Qg3qh3VUF2ZHQR/+eDheKjP/Xy5EUG3UyX+aSL3ZIDmlXBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J6VAgbO9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J6VAgbO9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c927152b4bso1239346a91.2
        for <linux-coco@lists.linux.dev>; Fri, 05 Jul 2024 09:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1720195467; x=1720800267; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0j8hAyQWJjGjX5p48jR0ZeFa7oUdUxgMcRMAfmdz3I=;
        b=J6VAgbO9HzuhZ/FZr4H/PEin/LA11g/TNsXj3wjI9TYkXvdFPxO7sshv8iS1E2Adn2
         0FR2q1xaORujGaM7ANXeqq4G3KR7a/7V0+FYXvIaJe/pp1cMRCp0tG4FuWu2YojQ6pI3
         sTC+POvUYzgKum1B2Vwy34sDLcQMMXaNiqB/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720195467; x=1720800267;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0j8hAyQWJjGjX5p48jR0ZeFa7oUdUxgMcRMAfmdz3I=;
        b=Ilrks17s+7k4Uz82lppOmyw3YD2thQ9gtVL/TPEY+ExPmcZRKSfTtvVKX7Q3cK6/rv
         1C485vSwEixbW/l+OFnp2YcV97sZAIiUL6qb3lSqBKj2LKxtzzkQJvPVeSBAl0yZJqb1
         DEQ3ejnFj0gviAh4BfCjAQdjYoiA3eAY0Srp7Am8WNMa3EjffYp5v22LvJ4OKM9k2TDk
         P5pko7OXY2FeETuGKsr8PWgXlPlXkoeyBiIGVk3DwYvOqf9FuKJhDp9ulo38a5s7RSaP
         cUmbyfwLP+tDMF8iK0wOkvkRY/KBQgMCIDlQguJtKcizMUFWNcsaJiG+uYG7p6fKw8m0
         eJDg==
X-Forwarded-Encrypted: i=1; AJvYcCVuiXxi65EV0y+kw3NwWEE2vbeygLUWeRNIJKqFwTC52ZINyQs3wAVEW5HYCgNKAH4sXVc8q/bZn5QweDiDYyBBBrf1UKUzlgWHXQ==
X-Gm-Message-State: AOJu0YyDVECYLOZeHQiHC4rNEheUWVNFOahDRW+/1RUWDOWRyes+OrKE
	S4MsL438XAz/3tx1DKB8MitGOqpg8Nmo6oWFcNr0u1oZH0S8I+Z+lLT215SScw==
X-Google-Smtp-Source: AGHT+IHgkOSaePxDDnJHq1U7KDyApbljJxbvMpXvGQArIGdlvWKuaNaFIdtcRXK3XVmYMcGfw2r45Q==
X-Received: by 2002:a17:90b:11d4:b0:2c9:74cc:1c1b with SMTP id 98e67ed59e1d1-2c99c504127mr4043383a91.7.1720195467069;
        Fri, 05 Jul 2024 09:04:27 -0700 (PDT)
Received: from prme-hs2-i1009 ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a992c43sm3576853a91.30.2024.07.05.09.04.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 09:04:26 -0700 (PDT)
Date: Fri, 5 Jul 2024 09:04:17 -0700
From: Tim Merrifield <tim.merrifield@broadcom.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Xin Li <xin3.li@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Kai Huang <kai.huang@intel.com>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Brian Gerst <brgerst@gmail.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	virtualization@lists.linux.dev, alex.james@broadcom.com,
	doug.covelli@broadcom.com, jeffrey.sheldon@broadcom.com
Subject: Re: [PATCH 0/2] Support userspace hypercalls for TDX
Message-ID: <20240705160404.GA15452@prme-hs2-i1009>
References: <cover.1720046911.git.tim.merrifield@broadcom.com>
 <33874bf0-c115-4185-85ef-684794de3c8e@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33874bf0-c115-4185-85ef-684794de3c8e@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)


Thanks for the response, Dave.

On Wed, Jul 03, 2024 at 05:18:22PM -0700, Dave Hansen wrote:
> 
> Could we please be frank and transparent about what you actually want
> here and how you expect this mechanism to be used?
>

Sorry for being unclear. open-vm-tools is currently broken on TDX and
the intent here is to fix that. The idea is that versions of open-vm-tools
that have been audited and restricted to certain hypercalls, would execute
prctl to mark the process as capable of executing hypercalls.
    
> This inheritance model seems more suited to wrapping a tiny helper app
> around an existing binary, a la:
> 
> 	prctl(ARCH_SET_COCO_USER_HCALL);
> 	execve("/existing/binary/that/i/surely/did/not/audit", ...);
> 
> ... as opposed to something that you set in new versions of
> open-vm-tools after an extensive audit and a bug fixing campaign to
> clean up everything that the audit found.

I understand the concern about inheritance. I chose prctl primarily
because of some existing options that seemed similar, mainly speculation
control. Is there an alternative approach that doesn't suffer from the
inheritance issue?
