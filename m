Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DB199E9A
	for <linux-coco@lists.linux.dev>; Mon, 28 Apr 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857851; cv=none; b=E3j6R1+lk/LIT/Xg8MOlZrLpAvR1OzmFNo6qy/GBu5g1EHhc7TajzjGnOHNQd20YrWWZn6bRz8gHUXo3Mg1AzIImC8cNjAcs1C51TbmL5rbzvH7Fi/IgBVyKUyNqBrIECDVUmM2FYH4PHGdL7gKsn6Awk0TucRRQW9rQtC+2On0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857851; c=relaxed/simple;
	bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=naYdMVPs7J9o3RZuDyrhqZHbODVkqL4304IO4FA544j60/9brDyJsC5SZ8WBf6hZvITG8DYBc3liMuDn8dlUwJer3p3OPtWRCMbWR4NJsLuDSKvWDvGuCnT604Fy43bhRn2Xvbt+MubhrJ7pPImQm+lmXROqsOw/eM+yFAp8rL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGCie+Dc; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGCie+Dc"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so291cf.0
        for <linux-coco@lists.linux.dev>; Mon, 28 Apr 2025 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745857849; x=1746462649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
        b=EGCie+DcJX5VVFAjkvGmWZiOSv1MPOK6d5EFS96hLFznrhbZAoISku/SmFssWoou0b
         mJZml/u+k+oM7puxkNUoadhk+F3sPj9PSQoysSNM33J6ZdhGps+6xvlZFJZxo8u4QVbs
         8Ioc/jrP53KPE9+PAEqMJGgVX9Fjkag4X724niXZY3ja3kIxMhlkNr/SVah8XbcS4xEA
         cfckURpbexquVDw41lMku4QLf2Ini+K+FZt/b9GebjYaOgBluyztVODo6ml25U+sL9tB
         e9F0V9wBTakpuQJtp3bKrh8ffWKGTlFiIsc6ncambIMV7FIc9S0ivnIykCwG6A0Gcfnq
         Q2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857849; x=1746462649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2j3wvBAtJ0GDwgGXeGIR4XMhG+aqgluAkbj+c/x8BE=;
        b=E6i3YMyEwYB0yKV1sujaFDhS8G1QkNlfTamOYQ5vE+T1xW5m/0fVDeTqUdBpO3Z1fV
         PKvRFxJRDBBs4IfxcUBmrjoz5n6d4W6o6KkhF9MOCDTpSACXKqcdSGl8QTZ6Vn6hUdFI
         NlfdsnRTq1/ns+F1ruFBBpGnmra0otOcxXbjdHbQ2ceINbOhq3AZxG7QHlajOy7qwGJm
         K//o+ASLxVHztbdOBeDJQC407VIH/9jtDiJElP6ubh/CwrjRGwbATtT0IXEhDfWGKo6W
         hJGnQXtS68x6M1iEs6cKwrNd6uPfpAQuUtbBoEPvqUJW+gF7rpQHa1DoFageihNT8iLf
         R8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFrU7zZQDEmofWYMJyJBTAeHGWAToZPJeZP4f4+yBparuuK2NWPaKnukPk29oH4ZQIsq+McEL5cu/e@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuf5RyII+rwABb5knA5DKqXQdHfsxswjxy500kPW7FTzPj7Y6n
	sgFhy9jem6j8hWEt/SpfNg+XQFY0VnngzYXKRq77gBrEQ8dLCag1NvtzNdVLimqCjA76l/oWzhM
	INKcbuipVDETSaDmoKLeXdcroHfYY1plr6u2L
X-Gm-Gg: ASbGncvAj3xgvhZ6H4aFmGt6HO4fIwYMN9py4Yy6ykbRhIMvcfKTMSjuNsEfS2QOomG
	/KRdxaNt34Qynrr4iEonn9nK07YngWFmpZNCAuIUg1Sdht5edkHaVqPO0Pj28EhXYwDBrnRuBGO
	LEnHFNnS8GzrM9q6zoX6K02a8VWo8kj54=
X-Google-Smtp-Source: AGHT+IHISK1kxrYk4RfbziCnCnzPWCd0oWI+e9SVH/lBMnDhpa52pdJdvOhZCLc8iwRh9PYrrSIzc0NhpiEDqA7CwQc=
X-Received: by 2002:ac8:5d4d:0:b0:486:b41d:af93 with SMTP id
 d75a77b69052e-487fe63bc50mr533301cf.20.1745857848688; Mon, 28 Apr 2025
 09:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <174491712829.1395340.5054725417641299524.stgit@dwillia2-xfh.jf.intel.com>
 <174500659632.1583227.11220240508166521765.stgit@dwillia2-xfh.jf.intel.com> <9a4b347f-9a18-4578-9031-0d1bc98e668d@intel.com>
In-Reply-To: <9a4b347f-9a18-4578-9031-0d1bc98e668d@intel.com>
From: Jianxiong Gao <jxgao@google.com>
Date: Mon, 28 Apr 2025 09:30:36 -0700
X-Gm-Features: ATxdqUELDAnyO3GkumJUBV1EJePzSaA7vBfrlJPvUNeMSl7GggLRW3jYHMePSec
Message-ID: <CAMGD6P0ORZF6Tbkuedv99jEpk+6HjG=pyqCwTHKU5dVxt+kRCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/devmem: Drop /dev/mem access for confidential guests
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>, Naveen N Rao <naveen@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov <kirill.shutemov@linux.intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, stable@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:53=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> Would most developers reading this know what an "SEPT violation" is or
> what its implications are?
>
> This results in an immediate exit from and termination of the TDX guest,
> right?
>
In most cases yes but it depends on the settings.

If TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE is set then the TDX guest
is terminated immediately.

Otherwise a #VE is generated for the guest to handle.

TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE is disabled by default. See [1].

[1] https://lore.kernel.org/all/20250401130205.2198253-11-xiaoyao.li@intel.=
com/
