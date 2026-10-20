Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500924;
	b=yAw4UGTXkIOedY3imLmJTd9GKdV+5sdJaO//T8s5my9zJbcKXIPkpZLOAtaVKoDz9nPh
	 SKL6XX2aIdxzQ1s5g5XOlimzoq9hqpvHC6QT6Edq07r8FgX/uT95EYRGrdZUsp0pM9Ey8
	 It+W8Npv2KX4KOH7tAd4FnEdGYJZJvMwpGXaWlp0MlAh3BBXQ0Ki+eVi5cgusiTMHmHW/
	 3ACD9Ki5+cTpGLVmV0pQWf/f4VbeDrVJmK7OC0JfdzTxh/dou6u6qeYOzGtcHj5k0KsIm
	 JltTXXG22eps1g3P8MUDogGynEL7Ydtk/HOMWqSbsrH8m8xA0rVLixYQJbZxB9i4Hxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
	b=R/fQYh35dVYS54lRZFKomZ0j0FcQGjn+uS+9IughYPmb5f/GaXMMOwh9XorShtUVQIhV
	 cTQNuwZS+xWh+kgIviLw0pjaWuR5Nrfh4//KAQQFyYPjEqX5E9jAHsuWsY6eqkRHzpY4E
	 3kb4aopv17g8+23iR7UnV/BfZ3Kawpew8mS/WCZ9m4RaLxYGD23rjIwrzEM/hNOJo7QI1
	 tGkBdhpSFztzoLnUx9ILzf8UFFAU3u6s7566Ed9SLXLcHgjq2gePNYnTcvWGQwADOxbkD
	 KvPn/8OdfaC9Qxaeq4oTmWcsDao2Bp5UtFFBOPJYnR2M+LdVk/vpk+1rvS944PYZ9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dUnxE2SD;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC058606A31C
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 12:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC058606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dUnxE2SD
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91befbcad6dso39653746d6.3
        for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792500922; x=1793105722; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
        b=dUnxE2SD/fu0Jkq2Pvtc0D+aM86l8E66nl4OQEDeQXWPcswOlMw5jJiX53F50yhOJo
         KxKlIKWGgBAeMzcjzgnEyCQd+5EqrGiz8etmiqgSgE48VHhoCiOkXp9L57NQu4GRS5Yi
         hz8jzBgRdq1yN53RS8bEgUYNbfTTivHKvPjvQqmqjI2l2Bo0wxUuTEYbvELoYlHldfLV
         wd+GpgWfuksQD16eyobt71G+ull1P8fETCA4JE8vtXJzh82MXmL77JONj9ZtS9/fkbPd
         SWua28rwFBimS9D7evm6aVD+bJLQKWesrDp7/R6pdB64OrlVEu7j85ovvM8aJNg/g1QK
         ug5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500922; x=1793105722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
        b=fvENezVW25vfl1XK/PEy9OXTQ1x6uToNjgUH8k78nKyiCATmdwV9wvmkyxjyO0ygNi
         u4QYe9aXfdZ0xl2cSUbflwvxTzHFi+sba7O7Ku6XKAqqTIYCkmkicmqBRjkHuD9vb8Ql
         EAf7jfQNObkQyBWciEH8e57BppFZxqgD0hnRhgJAdB2pOoZktPoYpr56V5TDYI8iN1lX
         QsvpFqZVtImw9gBFo1C/JUOzW2g7YXivolRWMdf3oySfC5eNoOTzhFu9liyjb4bGMLGf
         p8WUgD17WMSPRnIZy9ZuFTlK12RjMZGgTjt34GyIUo0Wfwj5HGXbYlwg2WOAhs1RYJ1E
         gndg==
X-Gm-Message-State: AFq9FYKMm/IV9herVJ9dP2txP373cbXdWvVN9Cd9IeSQfmO/SZJS+mwe
	QDKaDnAj3vk/pl4HyfkTWKXKcfkraNItiZP234+JfaleCpiOrf6urhMu5s+s34wSyho=
X-Gm-Gg: AYBFou23pvuGBkIgQQWV9iUKkjMIHnB97Miz/iCr3dpj7OgUMJe323pDE6+bSZXZ6kW
	UZLJhJz0ZdX9+L6N3Hr2fGchQXCs2G6aIIA3fiQqJHXdOmZbhDPp3mD5+ESzsysG1JRFhXT6VNu
	gnMHSAfsRDss6YtQZ+nN/lk0zb65EGeYWyZ/AfgmFoDWDxLwtOJ3QhuoGk/OVtZiPJPYrEUph3E
	zg0l3Fhp5T2UGzIRMxbIpsn+D0Y2z9h0E8FGf+SevNw28gg/nsSQi0Rm2G5vFnIdhqNtTwy/wbf
	z5T3nqdOcC3UlYXl17nsxKIlVY1L6IiI5qk2JuiDY0wZsHbEDLf/3adQmy+H45mYZJmkrIvZ5RQ
	Onab4eu5LGP5uYB0yFcAnTMZbcbJ1Fzoi/zTdOqooZB9rEdHyztxS32Whfb5QqhdpifYxEG/Iur
	eKv1lxV5zU9O00uohI7lbTyiNkbV5rMAfbgQ7MANMzdG6toocGIgyEbXDAmVuGTWmThKZ1GYXyl
	RSO8W7jNFZegVnsbNq0xbpbYq2NCOpC7OOX/AsallrVED5qf8diCPfj
X-Received: by 2002:a05:6214:626:b0:917:8752:8214 with SMTP id 6a1803df08f44-91bdec2e198mr180120836d6.1.1792500921889;
        Tue, 20 Oct 2026 05:55:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c03da5b4asm26796476d6.0.2026.10.20.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:55:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJ9NA-0000000CTFP-3VJ7;
	Tue, 20 Oct 2026 09:55:20 -0300
Date: Tue, 20 Oct 2026 09:55:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <20261020125520.GN14213@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
 <atdeH3nA_gkLwPLM@FV6GYCPJ69>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atdeH3nA_gkLwPLM@FV6GYCPJ69>

On Tue, Oct 20, 2026 at 02:28:55PM +0200, Jiri Pirko wrote:
> Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
> >> [ ... 238 lines skipped ... ]
> >> --- /dev/null
> >> +++ b/Documentation/ctlv/families.yaml
> >> @@ -0,0 +1,13 @@
> >> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> >> +%YAML 1.2
> >> +---
> >> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
> >> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
> >> +# list, and every other entry comes after the entry of the family it inherits.
> >> +# An entry may be marked deprecated, but never reordered, removed, renamed or
> >> +# reused, its position being its wire identity. Every entry must have a
> >> +# specification in specs/<name>.yaml, and is added by the change that adds the
> >> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
> >> +
> >> +families:
> >> +  - ctlv
> >
> >I see where you are coming from with this, but it is going to be
> >problematic from a global kernel perspective. Given CTLV is imagined
> >as a general tool for any subsystem we cannot control the tree that
> >things merge through. It will not be like netdev where there is one
> >authoritative tree with a linear history.
> >
> >So if Bob and Jane maintainers both add their own subsystems by the
> >time it gets to Linus the IDs will get scrambled, and bisection will
> >be lost. 
> >
> >Either changes to this file must be strictly done in a single tree
> >with shared branches (which is going to be a bit hard process wise)
> >
> >Or we need to put the ID #s here and have some simple process to
> >coordinate them during the development process. Since new families are
> >probably rare it shouldn't be a big deal
> 
> Exactly. Collision is not very likely. Explicit ID or implicit, scramble
> would still happen. And in that case it is resolvable.

I think because of process if it is kept like this we will have to
merge 'dead code' to reserve spots for people doing new work..

But at a minimum this comment above needs a big fat warning not to
change this file without consulting with XYZ to coordinate merging.

Jason
