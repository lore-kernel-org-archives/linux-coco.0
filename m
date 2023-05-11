Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FA3FDF
	for <linux-coco@lists.linux.dev>; Thu, 11 May 2023 23:03:03 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a950b982d4so445665ad.0
        for <linux-coco@lists.linux.dev>; Thu, 11 May 2023 16:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683846183; x=1686438183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uB2iqlK11OQsKPd9Pr1QSGgzqWB2tqFxHS68iHnGQns=;
        b=RWmON4VeXRg726Drr60jlakRmM+cWHoNancE+z69c2c9PPzUWq+Qkucb/Jc3iMoo/Z
         DaR5eV+kEPLKbHzvrcFcJhZdU9QKFDvtyZ1M/bwRqxLLvL8q9Nyu/quyJmHdLogNVshe
         Bs4CxefhMIP+sVOa5ez2hraCriFiQFp7MtFz+ALzBQ5wERl0qSqON5DPizJx/XvJDmeH
         YelRz/mtLw3VwB5G4mBCX23meLfPO2miiJVrgziyJfWO4fyftyI+aku9cQU932UjDQAE
         HfylxX05aegejIT6AzxnWB7MwnTHVLKXWDhETWB5bSjMoCtfhe3NGwqxdzUDEfKvhBR1
         /WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683846183; x=1686438183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uB2iqlK11OQsKPd9Pr1QSGgzqWB2tqFxHS68iHnGQns=;
        b=U8HDfYCZTvN+TXX2D7qEzqayHGPjgp3hVjSo3LHwGcrnEstjOigLhWbVoq5BHU8sVS
         QYfZZPpk1EanyL6Om1iBsvPXOqsYCyMR59wXNdrzFr0tryhtzUlk4XbkHft//Q2pbPgo
         0RgDJF2JmGnqW9Zso0wzdYBEy7RLrgI+9Cj0RLT2iNp/2+MUlX4CpFqFfOz1dEMAYHbx
         LEq/ix16Nd4hvoT+avmml3ornQGdUtrBBXV+drW6OtfRTGJL0oEet1zNAFo+hLuVgwWR
         TSYFd4y3jZgRk+3UJXM7gGboR7Wzg+fo9+hvSM0BhVYq/OsCWhW/KEtvIhuT2DoJ0bAu
         MG3Q==
X-Gm-Message-State: AC+VfDx+wZDivcltEOgsd5dnLJ2DhRCrKDd2i8YU90XQ8YXBUFxLEWT3
	rqTDCq9jWS7jeSIxDH1dx94zVwX28IY6ScctQWYLhQ==
X-Google-Smtp-Source: ACHHUZ64VnYmS71+rD9l4jUC2YQ3gX3wsLmYkLHhKgjyoMKx1yuh1vMc6oYGJskGIumQz6tzdZGDUjW/uKNeU+fF+Cc=
X-Received: by 2002:a17:902:ce8d:b0:1a9:343c:76e5 with SMTP id
 f13-20020a170902ce8d00b001a9343c76e5mr89434plg.18.1683846183027; Thu, 11 May
 2023 16:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221214194056.161492-1-michael.roth@amd.com> <20221214194056.161492-53-michael.roth@amd.com>
 <aab7ed11-870e-579d-9328-4c32d9936392@amd.com> <66039193-14ca-5edb-d8d4-ca732d8c13a6@amd.com>
 <119075dd-5f3e-a393-f543-6cdfd34cd337@amd.com> <385016f9-e948-4f7f-8db3-24a0c0543b3d@amd.com>
 <55e5f02f-4c1f-e6b0-59ba-07abc4d3408f@amd.com> <81037a58-6b5c-cde4-79fe-3686d9b8a551@amd.com>
 <b0baa6ee-ea6d-3a30-d5fb-3ec395896750@amd.com> <dbcb6666-270a-4867-6de7-73812d32fd8c@amd.com>
 <7fb25176-3752-1be3-66d4-a7f5a0e1617a@amd.com> <682c0bf9-ccf7-9660-21fe-925ef63c5fbb@amd.com>
 <4c642bd1-5f1c-292e-398f-eed699db590d@amd.com> <65cb8f0f-7e8b-6df6-6bb1-a9f1add027bb@amd.com>
In-Reply-To: <65cb8f0f-7e8b-6df6-6bb1-a9f1add027bb@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 11 May 2023 16:02:50 -0700
Message-ID: <CAAH4kHYDUGnUnZt2HUVcGqOYyzsyUhBXUqW+iDyvKCtQW9XuEQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 52/64] KVM: SVM: Provide support for
 SNP_GUEST_REQUEST NAE event
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, wanpengli@tencent.com, 
	jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com, 
	slp@redhat.com, pgonda@google.com, peterz@infradead.org, 
	srinivas.pandruvada@linux.intel.com, rientjes@google.com, 
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org, 
	harald@profian.com, Brijesh Singh <brijesh.singh@amd.com>
Content-Type: text/plain; charset="UTF-8"

Would it be okay to request that we add a KVM stat for how often there
are GUEST_REQUEST_NAE exits? I think it'd be good for service
operators to get a better idea how valued the feature is.

-- 
-Dionna Glaze, PhD (she/her)
