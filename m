Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC432AB23
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uD6G0OMr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-536ef8a7dcdso14983a12.0
        for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697470775; x=1698075575; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NhCihnus/1UsJgusD70Ug29QHTArGWM++EsIoYPCw3E=;
        b=uD6G0OMrRGcjVAxjEw4MIE1Qby9CJOikRdpxI45QaH1tfiz0Lv0494RvpOVoyYJvzp
         5OKT5vt7b7sDO+yoiPwByFiFDWVyHDXo+MuQ+AjHUdYHxGwFwE7oSfDVncT5XrgKjQZD
         1cYn5mlnLwwRBs9XvNA8Em/+gkgYDmINcpEIYoMlpBtPVNzFXRTn545iA/7dc9EcbE5o
         yqJDLgxpi/1Wev4IhlRrpCUUXyOwQJRpXqqCNL1mVP5RuU53yowvwsQ5rQiAvEdMjbwD
         ilyTEjIruvxSGqLZsHuTnKWLXGDkloVuScfqn2fK62wdM67yuowisxWEylLbrqESOM+E
         g7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470775; x=1698075575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhCihnus/1UsJgusD70Ug29QHTArGWM++EsIoYPCw3E=;
        b=XwAvRdVq9tiRb+OK+fQVY/WrLsrzZecNJfZc8kagHuNgBaIUYr/AamMxPbyFS0Pyr/
         vLgc29h4alIb+05n7D8XNEsopXYcnMJGN29FqZrqUpofUZGtAYEHZ4WDqF8d4bQ8AUF8
         tRe92DIPE9W8/a8OCL72q//mJgzpuI5qiG2J6Qz+Xyu/aQFwGbv+mnktdHzDkJk7jCbI
         C3qbQXn6eRm8SfdEvCylveh2zYiv4uYjyxKxjM0LWxjRwfKHquJ/x/124I6Tm2uK7GAR
         3onm68IwEcS9q5ZGsVbloWmDZMmQgMr9UzmuE91sZKQf2tEZzj62sCOp5Yc9OAWFFQUj
         5irg==
X-Gm-Message-State: AOJu0Yx3lWO9+zf98T43sJyN5jx5ri9Grwuq4sdDwVbg3M/umvIzbIw7
	NYkmkwb0B1p3lPhoDo5+rR261p0GizAD7Nxyb4UgEA==
X-Google-Smtp-Source: AGHT+IFx6/XETVbdp8N7So6d/Z7pCC/FGv0oNrXG/bVQsCFWJF4/sh2Pcya91soZ/aJ5snE8pq3HT6wO6aDL8m7SHYI=
X-Received: by 2002:a50:d682:0:b0:522:4741:d992 with SMTP id
 r2-20020a50d682000000b005224741d992mr228408edi.4.1697470775542; Mon, 16 Oct
 2023 08:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com> <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
In-Reply-To: <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 16 Oct 2023 08:39:21 -0700
Message-ID: <CAAH4kHY_R5-fCo_=n4=k+kE99EVT8m1tcOytK2MUessynE7X7w@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, peterz@infradead.org, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

> > +
> > +     struct snp_guest_request_ioctl input = {
> > +             .msg_version = 1,
> > +             .req_data = (__u64)&ext_req,
> > +             .resp_data = (__u64)buf,
> > +             .exitinfo2 = 0xff,
>
> Not sure we need this line with 0xff.
>

The exitinfo2 value had an uninitialized memory bug, where random data
would get returned to user space. I think this is carrying forward the
initial value that sev-guest currently uses.

-- 
-Dionna Glaze, PhD (she/her)
