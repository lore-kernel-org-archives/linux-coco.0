Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FB520297F
	for <linux-coco@lists.linux.dev>; Wed,  9 Apr 2025 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229985; cv=none; b=SbPe28E72tfXL35ROLH8NoVilz5sO1IMOwfDrjolOr8ZrI/gh9g7w3cARKScjtnY2Y2ri9AgX4Nmu6aYYVDZV3mR8bQ2U5O70Cl4Hp2qZNVNwBvRxjBmeCU4GiOegx2tcZFFBdixAYM3zGTW94gNsvn3FTlK6gwKvcGkkCBZrnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229985; c=relaxed/simple;
	bh=vFYL2A2m4BVqGIUPwG+SJe8Wi/rBo/+xMXvF158DHXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVBLrl0hXqXuzh+jIaZKlRX1BXWcoXJ1FS2hn1O7VuhYUO92y1aF3sXRbJW27AhkYrmbayY4h1jztBdPL9+NQnKFSyOYMgiNVVvhUtzhxjY2qWLdwsqq2ZWaQ1IcDsfjT3EyL+dP6NrnbvetxkQtRvmRtbUDHh0k7slFAnGTnck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Wk649vqk; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Wk649vqk"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e702cffe574so54000276.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Apr 2025 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744229982; x=1744834782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsHh17W+bDIV1e4xVUO/JwjeRPH7cOalB9Js2vjnhrU=;
        b=Wk649vqk3X3v42pN6C2gqHKu4CTqYVil4O3wkWfUfIlI3Z0nEQ6HQO26xRyDB4bSGY
         0O5jixIXdYS3H2xtb3A59pbBCl6n0O8irFJxLBftx2Kdr5vcJcTIzWJ9r9DkKnVim+yp
         h9vZwjavWTM+YZSvw1z2zgRPphtLSkxSJZWAUrYSn72v/gB5MyZNIRpGpBldR8stkpQp
         iUen69g283lGJcwtfMKciha46j7akeKHXd1ecFSuYt7GXEfkkdymyG1PPLhNh/OR2w5t
         9Wc0I/FSMer1iCjvFBvza14ylsxEs4fTXkZ+QMeztflTPzuhaqyMZkTOaE69IXZDbfLd
         5BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229982; x=1744834782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsHh17W+bDIV1e4xVUO/JwjeRPH7cOalB9Js2vjnhrU=;
        b=OGgXZXabEERFflnFzlmp4KGHOkhcrIxGR1KkZPF5Ot09uYgnaMJTUDYABGKvdjmQ4Y
         Qii4NDxnu+Jb2q8q1Tt2O1OSL904xlmvgljCpv75LYXPg1d7dqituZI9tzIkFT/kJ1Z5
         mejT+yWE0Iu8EaAjR53Ote9LVNVWnhsNOKsQJUvMagndMeDwYrh/Dq7QtoKHEsmYkBHc
         eAuMnXUtONPwxI/4GYohQerz+KesfZg3XGB7L5TP84k2zB86IQpS2E63f4X4jbjv9Zf4
         XQ3oQXvgMQpelUHnQGLXkXxgXW32XHOYlVZmJ5CayyM9BvfAW8NK+1fsAKSg6T+qHjdO
         DX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbp0aEYc6E39JLXx9XfKHwkoat1yAVPIzsF8ElyN+PzqBwvZCHgpTE2QVMayy2I52Q7Htcj9UhL1Z+@lists.linux.dev
X-Gm-Message-State: AOJu0YwecBi+8A13WYIF7NQSUInfqYhWm+zNGczIToh758fDWYfJsmR2
	L5M3s4w2p/wzrsel0R6hr2ra5zCHIqZUHz4MGzEVhUUBAEjUIH0O+4KLEAb3Gqk1VTitXtegQOF
	uCoJZPwKjUUyRX2lGsyn8RiCU+b3sQz6ONjOK
X-Gm-Gg: ASbGncuuCitowVmDNjJE6rZ5v35tflHZpMcXxsHVG0b/61RywaFKm5tm+4O2VnZskKk
	FQYZASClDhjIzeSJnRyNQpRJgSk9YK9X0YfH6IFx4LLRQG4ZszjP3VF7znRiRx6VEXFIZHfYUa/
	fLhUmLY1NUFgoC3+G7T2WvOQ==
X-Google-Smtp-Source: AGHT+IEGCJR9IA5jDMT2Of/TaTFQ6Kl+jhMbbHqtWzPYG+QuFj2lKMDW1yD44Tl3NdNB6jTiuM59Ql0Ux2XWfYO9+PU=
X-Received: by 2002:a05:6902:1b90:b0:e6d:f3ca:3e15 with SMTP id
 3f1490d57ef6-e703e0ecf38mr658467276.3.1744229981817; Wed, 09 Apr 2025
 13:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250408112402.181574-1-shivankg@amd.com> <20250408112402.181574-4-shivankg@amd.com>
In-Reply-To: <20250408112402.181574-4-shivankg@amd.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Apr 2025 16:19:31 -0400
X-Gm-Features: ATxdqUEUOdbJE1FR-JWrcEMUFKxoL7rqK5e8WWf2cXUgc2Yd72xDgueuEkSahFw
Message-ID: <CAHC9VhRFBOC=cZB+Dm00cshwBSBaK6amv+=XFLPF0Bub0gHN+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v7 3/8] security: Export security_inode_init_security_anon
 for KVM guest_memfd
To: Shivank Garg <shivankg@amd.com>
Cc: seanjc@google.com, david@redhat.com, vbabka@suse.cz, willy@infradead.org, 
	akpm@linux-foundation.org, shuah@kernel.org, pbonzini@redhat.com, 
	ackerleytng@google.com, jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, 
	bfoster@redhat.com, tabba@google.com, vannapurve@google.com, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, 
	michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, kalyazin@amazon.com, 
	peterx@redhat.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 7:25=E2=80=AFAM Shivank Garg <shivankg@amd.com> wrot=
e:
>
> KVM guest_memfd is implementing its own inodes to store metadata for
> backing memory using a custom filesystem. This requires the ability to
> initialize anonymous inode using security_inode_init_security_anon().
>
> As guest_memfd currently resides in the KVM module, we need to export thi=
s
> symbol for use outside the core kernel. In the future, guest_memfd might =
be
> moved to core-mm, at which point the symbols no longer would have to be
> exported. When/if that happens is still unclear.

Can you help me understand the timing just a bit more ... do you
expect the move to the core MM code to happen during the lifetime of
this patchset, or is it just some hand-wavy "future date"?  No worries
either way, just trying to understand things a bit better.

> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  security/security.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..097283bb06a5 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1877,6 +1877,7 @@ int security_inode_init_security_anon(struct inode =
*inode,
>         return call_int_hook(inode_init_security_anon, inode, name,
>                              context_inode);
>  }
> +EXPORT_SYMBOL(security_inode_init_security_anon);
>
>  #ifdef CONFIG_SECURITY_PATH
>  /**
> --
> 2.34.1

--=20
paul-moore.com
