Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46E7C
	for <linux-coco@lists.linux.dev>; Mon, 25 Apr 2022 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650872296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4+EWp9YScvG0/opJ/baqbMoZiCpKGj3I6/h6CC0ZAI=;
	b=GU39C2d07FZslnG203T2uPtqaY6YtEj3kqx8fNi6U1ksML2pjRY3dl3PXKIhxtyOSx9Oqb
	dXRqAvcqeYOA+PFulDRwZOat11N7DhB3L2lyrGwt6OT8NFrOU7hXi0oLyjlazTmTWC5G7H
	+mvn5Q6ZbXP6c6Qhlt4UQs16kyotIkk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-BMdTPoPFP2e8xjOmsNDRsA-1; Mon, 25 Apr 2022 03:38:13 -0400
X-MC-Unique: BMdTPoPFP2e8xjOmsNDRsA-1
Received: by mail-wr1-f69.google.com with SMTP id e13-20020adf9bcd000000b0020adc114131so453248wrc.8
        for <linux-coco@lists.linux.dev>; Mon, 25 Apr 2022 00:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=D4+EWp9YScvG0/opJ/baqbMoZiCpKGj3I6/h6CC0ZAI=;
        b=CZ4WC2/Sf7Gjhve5+X3oqh1IA1dgsRmsevjz672x/SLUWN79S/P2g/FCTmE8U6ihJi
         TI9KM6fImJWbIqBNJamGGoU8y89h5J0IjnfM+aEwADerSo7giJox63QLUW4yaqO5gr/i
         5iLSRDkwQUZGBkGK20wNw5RNEDaNNotcBsCFBFJN87ES7Wct/KRgyRHQsLpZGMWjePN8
         ySklidInY6mdr2pfrWPeIGSmLctCptq3RZhTuC1/Cft/gwsJ4Q35WoscM9cb+XWUzVIS
         2gFs8ME5kuHSiW9Uij/Xyd7BHkKBdGA/hPW7iwJ9KZJW2GsLpXL7FSpR6OnkaOlR03+6
         kmQg==
X-Gm-Message-State: AOAM5315pWq6wL/OjqkyCPywJduq3dml0MY1Mkszc17/pjy6r2m53bmY
	Gel0BVgpUWFy9OTHMS2KWL0nkr/OR8AdcQrpH+6t2JNcArayG195PSYyd10tkoTeKrD9B6x+jlX
	yRmaR9NQW9DP2Fz6f3x9Kdw==
X-Received: by 2002:a05:600c:1c90:b0:393:e5b9:b567 with SMTP id k16-20020a05600c1c9000b00393e5b9b567mr8792569wms.27.1650872292383;
        Mon, 25 Apr 2022 00:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGrMqdIG1qplpHlWo0bNbUMWHaIb+N0Tidl5Idj4Oc/xX/CaDQW7fkXG1PkG7Hd/M5o1cGWw==
X-Received: by 2002:a05:600c:1c90:b0:393:e5b9:b567 with SMTP id k16-20020a05600c1c9000b00393e5b9b567mr8792555wms.27.1650872292152;
        Mon, 25 Apr 2022 00:38:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:490d:ed6a:8b22:223a? (p200300cbc700fc00490ded6a8b22223a.dip0.t-ipconnect.de. [2003:cb:c700:fc00:490d:ed6a:8b22:223a])
        by smtp.gmail.com with ESMTPSA id y6-20020a056000168600b0020a96d2cf8fsm9498136wrd.60.2022.04.25.00.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 00:38:09 -0700 (PDT)
Message-ID: <f8ee624f-d1f0-342e-227b-8ffa9d133ba1@redhat.com>
Date: Mon, 25 Apr 2022 09:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCHv5 01/12] x86/boot/: Centralize __pa()/__va() definitions
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Mike Rapoport <rppt@kernel.org>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-2-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220425033934.68551-2-kirill.shutemov@linux.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.22 05:39, Kirill A. Shutemov wrote:
> Replace multiple __pa()/__va() definitions with a single one in misc.h.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

