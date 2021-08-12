Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65D70
	for <linux-coco@lists.linux.dev>; Thu, 12 Aug 2021 10:10:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id q11so283895ljp.4
        for <linux-coco@lists.linux.dev>; Thu, 12 Aug 2021 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bjc+CjLG6Iv82qU11Sfi0XGaTJtDXY6B92J7Iea/tYw=;
        b=WL7h+MV3gO51xheRxT8M0nMS5lzCmgtaD0OyY8g8CyKDYAotSM8J9VUqWuOJyU0Z8H
         OQiI7UZvXcorrJ0ZEnbbHf+v7AWpU8zRrYV6g3n2FDZJKnDcv4oajBfKEN71kU7lSxvh
         oOiCD5Mbub1ynCHrmHqixEs1vXRZuTt3TQfj+KqRzqfzDE+E2pf45LumB176U2a0q6vh
         2wKJmx21wyZ2ZUT/yy27mSAOwe31iUqreXYjEshEKDWJaS750hob2jSLZQ6+O6hdRG1l
         zjq6reRdmSMGsTQ3vqQl8P8UMDMVz4Vt2PF2M53ESRwORGlOI7ab1UXVPb+SClSisSyu
         Aq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bjc+CjLG6Iv82qU11Sfi0XGaTJtDXY6B92J7Iea/tYw=;
        b=VtGc4aH+82DMMOiT4zhbD1nK60kWzYUPnPYvUkJdQqbfMosvM9rllL4K9pJzTO8M2u
         iZ1bde4EdEkb+2wfMpECxizuT1iCEleFzv+s0+B1s8m8GqQMs2NkMGpEM2CFZXrosoyJ
         1klsKPd/FR2iUPVwNVwn0dCJ2yzlN2Rxg20nR+vTPcTlo4BIPQoIOkOEszljtpdC3Y0M
         oAxKmY1TnEbkzC8/Ljtm9qmeG+YH/kfvndi8LW3nrJ8d+G3gvJtW0b3LJYYwNdttTG1j
         73qWD9C+aCIMNfqcXGc2gzqTXA5eg6vLm+UhnuVR/5coeiK1w6sDKZghU7RIu3Hli+WW
         Ofwg==
X-Gm-Message-State: AOAM531EmGWNtjImx47sq316Y0mo7c/uwZn0Rk/12kuXvffvYKSlJDzb
	5GJ61r53CGJ6cXR8/e7Rpqft6w==
X-Google-Smtp-Source: ABdhPJz9RgDxEWcI/AR3ZUS5a0CZNaqrkDzjyU19l5Nj6+ycMvrg0eUGTdUs80D7X0HnPCmPykpnFg==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr2396040ljj.156.1628763041059;
        Thu, 12 Aug 2021 03:10:41 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id h17sm213210lfr.287.2021.08.12.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 03:10:40 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 112971028BC; Thu, 12 Aug 2021 13:10:54 +0300 (+03)
Date: Thu, 12 Aug 2021 13:10:54 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Joerg Roedel <jroedel@suse.de>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 0/5] x86: Impplement support for unaccepted memory
Message-ID: <20210812101054.5y6oufwwnisebuyy@box.shutemov.name>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <YRTafEovVZme+KO9@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRTafEovVZme+KO9@suse.de>

On Thu, Aug 12, 2021 at 10:23:24AM +0200, Joerg Roedel wrote:
> Hi Kirill,
> 
> On Tue, Aug 10, 2021 at 09:26:21AM +0300, Kirill A. Shutemov wrote:
> > Accepting happens via a protocol specific for the Virtrual Machine
> > platform.
> 
> That sentence bothers me a bit. Can you explain what it VMM specific in
> the acceptance protocol?

For TDX we have a signle MapGPA hypercall to VMM plus TDAcceptPage for
every accepted page to TDX Module. SEV-SNP has to something similar.

-- 
 Kirill A. Shutemov
