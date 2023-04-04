Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63B128F3
	for <linux-coco@lists.linux.dev>; Tue,  4 Apr 2023 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680627837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8sSDVvxyvnOruB+0lVJW1HHgkW7ZReKHR1WtAZfwmo=;
	b=FOhT1YFTA9PLzIK71aDmmQHpk4KnL1ljSlBh8sWcX9ewTOWUXh9gmI6wG+pne414OJpGkG
	G7zpVNk7KxJPy6+22tJJAPTjgpq54BKcQIm2iUMZc50DJo4olsf2ylN8nvcLihKY+0C9wL
	jYDlX+XmklMK55xH3GlvWFle3p+BPUg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-IlFvNfrpNw6QWWq15LRydA-1; Tue, 04 Apr 2023 13:03:51 -0400
X-MC-Unique: IlFvNfrpNw6QWWq15LRydA-1
Received: by mail-ed1-f72.google.com with SMTP id f15-20020a50a6cf000000b0050050d2326aso46559285edc.18
        for <linux-coco@lists.linux.dev>; Tue, 04 Apr 2023 10:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627828; x=1683219828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8sSDVvxyvnOruB+0lVJW1HHgkW7ZReKHR1WtAZfwmo=;
        b=PJRUK54K/ZyWdW4UzKqLK1TLYXEFMPmHM21PJCBlUgaFwqri5xopM45fQuUf/TZTqz
         BBmscOJ3JOVuV+pvRzdw1hJFAIqTAhH3PaBgULRViXqlN/uhWoCobjMsT3CLj4KWyV6F
         75kuacPSCAI/8B/FKSbwOtXJsJjpQAKXOAhUWnPHRHbER93cICykNdhlUZpVt3AdUs0n
         +vAo7giUlPYMGv9w5bK7FjLa8BEV9zH37d9gvYBR5V7sYPOL3XM2q0WqqEgj1kCbnA3s
         rotWZuATicDXO1ecMAOrCNTCRfDpRMNjFs4ezzm5Z2LyxrVdknqb4F84I7VQf9MWG2jm
         AV8Q==
X-Gm-Message-State: AAQBX9cuv/57NGIsg63ngCQePXeVpTrODwvWytlFumJ/m68yWbW7JjRv
	E0nGcZRKK5WxDINy5BjhVtNnP2GLav6gy90c+Gf8hzF42J8DDp6HN5bu0Gwr0oPZbomvqTQWQIs
	LX09IrpdS+lcxX8nVDbKN+Q==
X-Received: by 2002:a17:906:360e:b0:931:ce20:db8e with SMTP id q14-20020a170906360e00b00931ce20db8emr222852ejb.51.1680627828516;
        Tue, 04 Apr 2023 10:03:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aFFDO02CFOBCMJ38oBbcfDo2OcrnEUu9Q6JgQdWEtobOV1hRzKF0iFO6xz/n2FBierAH2GMA==
X-Received: by 2002:a17:906:360e:b0:931:ce20:db8e with SMTP id q14-20020a170906360e00b00931ce20db8emr222810ejb.51.1680627828194;
        Tue, 04 Apr 2023 10:03:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id j10-20020a17090643ca00b0092f38a6d082sm6128661ejn.209.2023.04.04.10.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 10:03:47 -0700 (PDT)
Message-ID: <3591487f-96ae-3ab7-6ce7-e524a070c9e7@redhat.com>
Date: Tue, 4 Apr 2023 19:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/7] x86/entry: Atomic statck switching for IST
To: Lai Jiangshan <jiangshanlai@gmail.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andy Lutomirski
 <luto@kernel.org>, Asit Mallick <asit.k.mallick@intel.com>,
 Cfir Cohen <cfir@google.com>, Dan Williams <dan.j.williams@intel.com>,
 David Kaplan <David.Kaplan@amd.com>, David Rientjes <rientjes@google.com>,
 Erdem Aktas <erdemaktas@google.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
 Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Stunes <mstunes@vmware.com>, Peter Zijlstra <peterz@infradead.org>,
 Raj Ashok <ashok.raj@intel.com>, Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Tony Luck <tony.luck@intel.com>,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
References: <20230403140605.540512-1-jiangshanlai@gmail.com>
 <19035c40-e756-6efd-1c02-b09109fb44c1@intel.com>
 <CAJhGHyBHmC=UXr88GsykO9eUeqJZp59jrCH3ngkFiCxVBW2F3g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJhGHyBHmC=UXr88GsykO9eUeqJZp59jrCH3ngkFiCxVBW2F3g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/23 05:17, Lai Jiangshan wrote:
> The cover letter has 800+ lines of comments.  About 100-300 lines
> of comments will be moved into the code which would make the diffstat
> not so appealing.

Removing assembly from arch/x86/entry/ and adding English to 
Documentation/?  That's _even more_ appealing. :)

Paolo

