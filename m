Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794253214;
	b=5HEsWav+crEGE4at8rCZlHOhD8gQ7VLkgtjxiiO5gP36IECrqZu+yIf5sLUGHNzn40xD
	 M21jG009UF0fBFHch0v2WUthjJqD1uko9RtqbB3sogyQRRfMvb66/gTw62B4DecB8YmGj
	 LZpHg93rz0X+zTSrOVlo0/h2MOoLPl+5tYi0WwONTApWrvVG3mvHnu7R4HJPzZs2Fbp5x
	 jiy44opmP3Fq8bJTyQrFI5de5Cn01qerIsT5IUwszXhwBloydQM/crlg9u2aQn50dn59K
	 P4HAgP3ArdJ0kUDYdsKReWrtNqWSToypIR6FIsBPCD6OC6DAubPhQF2LcYpilmcX0BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
	b=qe111pPpYIa0We1/kbrh6yavuR1xRy8ELsiFLK/jzLDrVet4g7Pn/dnlqKrTUsrdsnIF
	 hd7aiwTL/AIjyFeO1cvzNmChHbkYQInX3JtUEO7NihtRvKMuAC9l6Iq/A9ct/0FtI475D
	 +u14nIvd2X695R7EkyiUfbao3kKJ5cNjx0e0WBi0OW8wWqx2qUsm0R37tO5SkuGt1dWC7
	 gSnRcAMS+vS1fC9DvmbE4Bk8RJJIr2OrB6RDjaDTjV5czO3tpuD81wyboUj3lw2Hlkx75
	 fIUrQSvjTqfKB6BrcGtYMqfxN9wol8CAOboI2w74/xcO6tyrZW8+dVCn71eEzjXrF+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vt68WbTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0778606A339
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 19:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0778606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vt68WbTs
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91befbcad6dso13427116d6.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 11:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794253213; cv=none;
        d=google.com; s=arc-20260327;
        b=nc5zf2LGW45y31OUxcgaQXGG4uhtcQ5SAIucdo0bSboDQNHbdDV31qoNmdGZkRTzef
         oIqSyKT8Gk4wosYOBnKlH2aFk1y8bnIGLt/roAZk4zPY6CAgzfrji9zLitnGzeNEZJrH
         T/40X2+dKaySIQ4ffzihX4DAwrISh7AJZ44IfqCBOVq9XLtAMkcOGaGl6fgcdNM5A0m6
         SEy1Yt4dF3AmdOVpJ5y1fGxMhXMZ3lLt56+3H1YkN3DGOG/gdAY9VZ0E8IB30RjEsdQb
         3Y9U3Ol9EI/ifrng6jyXfIAZUKNw82lUc4zG/cagP+LCmaZNi6v8XFqzhxXTP3CpB8HQ
         fr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        fh=EaNv6/7YVPeVovVzIkDN07Nlgr4X6QKF4JkswFbQ0bg=;
        b=qUctHPIMerrzMwshl8QtUdMdqgO06Rld88giDtKv05V/0trqYNUL9aO8ZFwS5y7UPc
         jxBWU16H6BnpoWQGniO1rgXGl2pjrtkv2rppXb2a+cIswW+1IacLmHwZNvRSTqJoLnbg
         5KfWh8DVsAbT5KsG8h29BmONQDXOrOwIzw66aAdarCgRBJxo9laYLFMoVgp8NCKYg9PB
         yFyY/B/bL8Gv8k/V4m2KxZLIhE6MSJcOO9iK1ec/PX7kSkfhQv0zbVBYzdxdNk2jtTUE
         mdaoEkCV/AjwJrzV4S+dkTgkOfd+fRiBqOLLfCWMT8i6dvA7lUYLHkQca4eX2aFXdKDo
         t71A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794253213; x=1794858013; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=Vt68WbTskwaDYMoDen9HR3XOmclUbV2LXfduqgh+IRxlxmOLF36t/6yeH2nSk0g9Rh
         qk9yuyCrgEVUlCji16MgwgKavsMeHMJ233C7aILqcjPec1qbXoFxQ4axX0TYehHkEXms
         uLSbikVJrkuCy/jdETTrWtK/nCfw9WEWr4AJsrpL6QA9xjGjz0eyy2oqMXR840K5emIr
         JA0D7DB/h9aOtsQDF1kJWFj9AmhLQAVhECBcDNJw9jZkAFjOPqfNx1ggeoFaUYfYm/xa
         1DREzeiWJGOeOIfvvVwvVDenN/SRC2kbjSGp6ARgZVwhijXe/pVn+Z4Wg0I+ZfA2YePW
         /DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253213; x=1794858013;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=ydSnxdqgmIULqFIaKU1wWnqBFWoJRAbOT3rH5Jyl/HHTRy7iB2FI3fhmPcPcsEI24A
         ST01qVNQHqfr7JYsoID6XX13nQvx936G35c1/I7IItnhxhDch6ej0IhvqImKGYBpuqVk
         jDYi7OAkHWVxh3SoyrRDE66dZ6psRy2cEmUf3SE6RhR2SG0roPITkbHK89rRO9whfPqb
         oVfX96lTyOEi93FEvG+ssXFQBQIUNooMAgbTTmJEBYXKBRRfvjIvl+9fgWyX/TLB3iwf
         JP+X1wvEBz6b1WmFcjsim4HUu1OjI6qiYGTjB7Zk9ETf6J2g+Bz6KfLxWONDbubi4J1O
         Ef4w==
X-Forwarded-Encrypted: i=1; AL+hErFeFqbFkTyycQi1fxyEUfq/tX+l3KbqXnslc+MODsdW5udIMKsbydoqCEhlxL6zBAz94XaX5qu94Gdl@lists.linux.dev
X-Gm-Message-State: APuU4Z8Vtb5498yTohH08mbsSWJF+ZevXj0S4uY4IhVc5sJc4LaJLMmc
	7JkS+cHeUiq8NknuDjkcJi5t1HSOByP1wPkUWk+3rOzvjNRmL6xcLr17KF8FMlEhcyysqi3pcWr
	nXubPAYYcrsnrthwmZXf3X7QdnE7EW9zhqQ8iYkWD
X-Gm-Gg: AYBFou1wkIIlnj6aX03aBQAdmla/orXX0ARiylt4OdhaXVbJtHAb4BGxncdbRPSKCv9
	71imw94hpUgzB2xYzUbrGSK8pemDFyo/FEKPtTbKIpLJCHlvPI0XRoo9zXloPx2zZWvJO5OARxs
	1DiIn6S7cqvwuqXbDKlcC/dveCkgAncGNObuYAYWfAAvrrfmzwhVtU3L6Ya8n+ln3kuzxvYCO+9
	dkx5KCP008EFAInZso6EVvihB94jrLUyu35oHHXPGqmiTnUAC5XSTb6u9gk5TJ4JDQWqev2118j
	JwOQXc7+Ykg4Kdm9bm3yXFAABIUFvj98Xf6S3Gw/z2cuBNxTejv2PLOM3RIPCRwNUHudV6lqKai
	x53mBWZriHTBmkuls8iAO1od8Z9O57ssB+25ai2elE0M75DqVQ/84KG7uHJXtYIDV4IMWWx6qvO
	BFoWB/ycnxFrUpup7iVFgPzQ8=
X-Received: by 2002:a05:6214:1d2f:b0:91e:9437:95a6 with SMTP id
 6a1803df08f44-91eef866f62mr11481566d6.47.1794253211943; Mon, 09 Nov 2026
 11:40:11 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:40:11 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:40:11 -0800
X-Gm-Features: AclHuK_q6pntXPEETCsk4rrzlvTAf21VT6IGAyCXiwifcwkt004hhyyHMGQSvVw
Message-ID: <CAEvNRgGL7B_5q3N0Jc1dtSj=J+ywOXaSBDx+x9OWn5odMKN5Eg@mail.gmail.com>
Subject: Re: [PATCH v16 08/20] KVM: selftests: Expose functions to get default
 sregs values
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
> default values of certain sregs used by TDX VMs so they can be set
> manually.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> ---
>
> [...snip...]
>
