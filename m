Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74679B87
	for <linux-coco@lists.linux.dev>; Fri, 31 May 2024 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146772; cv=none; b=rWdU+JwQNumYtVE+DVDktU0V2wEfpkUM+j4nagC9zeiwDLFfBcHvq1QTae8RFTmBJU4/EJDfpNuOozf40qUPWIr6m4The4SBckvE9lcOsgK57cBdcslDR7X6Q7eJuY5I6aSeapXH5yHHgrFvInKqAZ0t4gXGjBPbJad0XjJK9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146772; c=relaxed/simple;
	bh=n043e5aPdAd/fC76DxpQ7PwPIwMDbOjKUBAKXlLMhrU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNVoUvrbq/T4DsS0jIeaL1CsZLc2mcPKlXmUfdA4mWYJPZqwrm0QGYW+CXKc4Ocdf4JEhtwA/BFvyg5catyrGVSIjXGJfngEimm88Pzkd67hsnXRep37SDBZqW4m9dEZovxyQEW7kfTnz/1JFKuExAWRvzOtuKdstl0VQy/Q82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqiSuNo5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqiSuNo5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b88740a93so539893e87.3
        for <linux-coco@lists.linux.dev>; Fri, 31 May 2024 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146769; x=1717751569; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6ZMuJgM1aDgO1ril1JnfzUqrJFWz+LSUP19WZBqGNc=;
        b=YqiSuNo5ZSA4qMv7NpzMbC+iWTmGkevQGrT6o6idnEcs8sq3UENOad3G0jyu9JxtCx
         K2rOSreB5S+xuXvRz+QSx7nZQ18iiVPyFBdcXNSZ3n9Sqzu7PBSjYY6jWuls9yjnePyz
         wFnTaowSob8jNI8khD49LYsoU2Qh5jjd0Mh5it6ySLmWefs9eJNlIcRZqjOm0Hn35rJP
         o8bBAwb5T3gJ22T3APS56GsT0l1lgHxSPoPw202B1/BPAVKAxibouB33DSmXIvatlLfR
         6vUiskq03TuY2/hS1KS+cBgNqP6cLejl/OGibbHOMsGqe/wh7a4SFmx0UuQypSklGdhD
         SC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146769; x=1717751569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6ZMuJgM1aDgO1ril1JnfzUqrJFWz+LSUP19WZBqGNc=;
        b=tYVJkFa31ACFc7wOBvb4LN7vmB6xjrOJhimiePeM04cIgyAZno1V/B8qvko19AdJ2b
         cjaI73gynr86lfmPZIAx5sL+R0vA+/5bJUb/hH6S3wbICYYqJYN/uKSJpp0G3VCk1JkI
         R5AieNuams4kagq/kRhafFWjRd06eIlydoNDLaH9I26ZrGDYQewnSdfxYuLNqI+190j/
         1b+Enbli16keZgq1yUuch5393eawaTJ2qneO8SOgJIw1RcZsCCbTxx8QRZtWsjQrobeE
         3HZCOIVgsK32+5BJcX5wHxEUcKD8b5JTruYzyit9Jfo6e2xJbEBoL+kymyxZhg48kmeG
         rbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW87U1LWvkZaOC/DuUBicIHIeLvHsh/XTPYj4988TywpVGegzNxJXk0waBFBAFlMZ0aJEya1M+K/uEi6Fy78/ImTdB6jV6Lm/tkFA==
X-Gm-Message-State: AOJu0YwgNcXNcE1H1Bct1h4KBesbke3BEDsLV+Gvwbg2KfIxN8h85E+w
	JzukCEFB1YrKoi/vNo/BqqNrN7jfcZ81pa+8lDauCb5T+w3dDZA5
X-Google-Smtp-Source: AGHT+IFU63l+mNBTUO22AXnMzH2w8LowDky00tObDxv/S9Yj6cn06SKwZt89GnylvhKlh4U8CcqWNw==
X-Received: by 2002:ac2:5a4c:0:b0:519:6a93:ed3a with SMTP id 2adb3069b0e04-52b89573bc9mr834468e87.23.1717146768652;
        Fri, 31 May 2024 02:12:48 -0700 (PDT)
Received: from localhost.localdomain (95.59.159.20.dynamic.telecom.kz. [95.59.159.20])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8724fsm261626e87.230.2024.05.31.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 02:12:48 -0700 (PDT)
From: Alexander Kuleshov <kuleshovmail@gmail.com>
X-Google-Original-From: Alexander Kuleshov <alex@localhost.localdomain>
Date: Fri, 31 May 2024 14:12:42 +0500
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, rafael@kernel.org, hpa@zytor.com, 
	peterz@infradead.org, adrian.hunter@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, jun.nakajima@intel.com, rick.p.edgecombe@intel.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com, seanjc@google.com, kai.huang@intel.com, 
	bhe@redhat.com, kirill.shutemov@linux.intel.com, bdas@redhat.com, 
	vkuznets@redhat.com, dionnaglaze@google.com, anisinha@redhat.com, jroedel@suse.de, 
	ardb@kernel.org, kexec@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] efi/x86: Fix EFI memory map corruption with kexec
Message-ID: <eihdindv6akbn7oohmious6cany3ezjqflefd74wmkl2nllseu@izczd5vs6vj7>
X-Operating-System: Linux
X-Date: Fri May 31 01:22:55 PM +05 2024
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <cover.1717111180.git.ashish.kalra@amd.com>
 <f4be03b8488665f56a1e5c6e6459f447352dfcf5.1717111180.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <f4be03b8488665f56a1e5c6e6459f447352dfcf5.1717111180.git.ashish.kalra@amd.com>

On 30.05.2024 23:36, Ashish Kalra wrote:
>From: Ashish Kalra <ashish.kalra@amd.com>
>+	 * but it is not neccasery for kexec, as there are no boot services in

A typo in necessary
