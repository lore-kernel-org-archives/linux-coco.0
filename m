Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE8A8C04
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675176204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAtdCvaYcBjQla+NfgEkiJO+riIsmgiBoPP1Uy0xazs=;
	b=De+yX+UBru1VN4O4oBTHbXFVAcHSEjUoRE98egDKwwlplSr7MoB3u9VZjaKgv+QIhch9zR
	/sQVIWT4+x6zxXJMhoRZqeFsfg1wLU2qz6ju7s1Dahr8wYsp4D7H2AKa+bw82ucD+veFOy
	jyeGpHalwSCQ/wXOuV+ZmzboTyDOm3s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-C3RgeImwNRe3kkJTnYMTyg-1; Tue, 31 Jan 2023 09:43:20 -0500
X-MC-Unique: C3RgeImwNRe3kkJTnYMTyg-1
Received: by mail-qk1-f199.google.com with SMTP id q21-20020a05620a0d9500b0070572ccdbf9so9242294qkl.10
        for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 06:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAtdCvaYcBjQla+NfgEkiJO+riIsmgiBoPP1Uy0xazs=;
        b=nkAdydcim2QFaT8TM0ahMs7Jfqn/8D4eGT6YFByf6z5Q54SVyHBrhAUfZv6hbZzsYJ
         iGpYOu9v1KpOP64Vp7u8pHylOv2OoAvX3NaqbmgDf9qqPIOtRx1sL/wIp3avGrWCN0U5
         VDuynjLgQndZqe0YPMYHGcVwLozIdkJB1mgiLrImxbMQnnahQiwNJnIaD1njYG3+6Ssv
         F03AueoIRSeU+iKcdQ2orVf8DnsaSxThyr3/KMihU5pMla8hAqrYScxY5vbpIgqZ9Y3/
         lIuDfYgOKhD143YiiYYHK05QVJg56+fc7M/OtR6AmelTU4hbgHleNevR1JUVI7mxxpbz
         N3vQ==
X-Gm-Message-State: AFqh2kp0ikTqdq9oaVWe0uUVd5pswirXx6kDATHg54yWYCcI7NIKdaDf
	PAfljdbjn3qbqHND3gI/G7/1vFjYhUV72Dq4rgwO551v3e+2pNn02DZWK9ZpL/YtT4kYfAl6xxr
	H786bSxOeDIyzapCyfs987w==
X-Received: by 2002:ac8:7ec4:0:b0:3b6:3c9c:59f0 with SMTP id x4-20020ac87ec4000000b003b63c9c59f0mr75200618qtj.15.1675176199683;
        Tue, 31 Jan 2023 06:43:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXH7IzWL307K632kUG5faoKR8tSdHwFt5EW1IhyhwYmM3PlJhpLhToOa2tJxLyWOWsmCmU4Q==
X-Received: by 2002:ac8:7ec4:0:b0:3b6:3c9c:59f0 with SMTP id x4-20020ac87ec4000000b003b63c9c59f0mr75200586qtj.15.1675176199464;
        Tue, 31 Jan 2023 06:43:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de. [109.43.176.155])
        by smtp.gmail.com with ESMTPSA id z20-20020ac84314000000b003b960aad697sm2448545qtm.9.2023.01.31.06.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 06:43:18 -0800 (PST)
Message-ID: <16e95056-919a-47dc-3ed7-50c29d39b6ae@redhat.com>
Date: Tue, 31 Jan 2023 15:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC kvm-unit-tests 01/27] lib/string: include stddef.h for
 size_t
To: Joey Gouly <joey.gouly@arm.com>, Andrew Jones <andrew.jones@linux.dev>,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>,
 Quentin Perret <qperret@google.com>, Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-coco@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230127112248.136810-1-suzuki.poulose@arm.com>
 <20230127114108.10025-1-joey.gouly@arm.com>
 <20230127114108.10025-2-joey.gouly@arm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230127114108.10025-2-joey.gouly@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2023 12.40, Joey Gouly wrote:
> Don't implicitly rely on this header being included.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
>   lib/string.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/string.h b/lib/string.h
> index b07763ea..758dca8a 100644
> --- a/lib/string.h
> +++ b/lib/string.h
> @@ -7,6 +7,8 @@
>   #ifndef _STRING_H_
>   #define _STRING_H_
>   
> +#include <stddef.h>  /* For size_t */
> +
>   extern size_t strlen(const char *buf);
>   extern size_t strnlen(const char *buf, size_t maxlen);
>   extern char *strcat(char *dest, const char *src);

Reviewed-by: Thomas Huth <thuth@redhat.com>

